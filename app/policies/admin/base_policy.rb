class Admin::BasePolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  relation_scope { |relation| relation }
end
