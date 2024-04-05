module Administrate::Field
  class NestedHasOne::Show::Component < HasOne::Show::Component
    def try_polymorphic_path(args)
      polymorphic_path(args) rescue '#'
    end

    delegate :polymorphic_path, to: :helpers
  end
end
