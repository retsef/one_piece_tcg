module Administrate::Field
  class HasOne::Show::Component < ShowComponent
    def hide_label?
      field.options.dig(:hide_label, :summary)
    end

    def try_polymorphic_path(args)
      polymorphic_path(args) rescue '#'
    end

    delegate :polymorphic_path, to: :helpers
  end
end
