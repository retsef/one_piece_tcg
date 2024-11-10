module Admin::Navigation
  class UserInfo::Component < BaseComponent
    attr_reader :user

    def initialize(user: nil)
      super

      @user = user
    end

    def initials
      'OP'
    end

    def full_name
      @user.email
    end

    def render?
      user.present?
    end

    def before_render
      @user = Current.user if @user.blank?
    end
  end
end
