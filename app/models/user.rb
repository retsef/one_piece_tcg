# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           not null
#  password_digest                 :string           not null
#  password_reset_email_sent_at    :datetime
#  password_reset_token            :string
#  password_reset_token_expires_at :datetime
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  # include OneTimePassword

  has_secure_password

  normalizes :email, with: ->(e) { e.strip.downcase }

  has_many :sessions, dependent: :destroy

  scope :valid_password_reset_token, -> {
    where(password_reset_token_expires_at: ..Time.current)
  }

  validates :email, uniqueness: true, email: true

  with_options if: -> { new_record? || changes[:crypted_password] } do
    validates :password, length: { minimum: 3 }
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
  end

  validates :password, not_pwned: true

  def generate_password_reset_token!
    update(
      password_reset_token: SecureRandom.urlsafe_base64,
      password_reset_token_expires_at: 1.day.from_now
    )
  end
end
