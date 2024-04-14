module Admin
  class CardPolicy < BasePolicy
    default_rule :manage?
    alias_rule :index?, :show?, to: :manage?

    def manage?
      true
    end
  end
end
