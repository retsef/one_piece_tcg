class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :password_digest,  null: false

      t.string :password_reset_token
      t.datetime :password_reset_token_expires_at
      t.datetime :password_reset_email_sent_at

      t.timestamps                null: false
    end
  end
end
