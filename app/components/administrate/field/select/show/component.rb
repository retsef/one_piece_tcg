module Administrate::Field
  class Select::Show::Component < ShowComponent
    def collection
      [ [ t('helpers.select.prompt'), nil ] ] + field.selectable_options
    end

    def option_index
      collection.index { |opt| field.data == (opt.is_a?(Array) ? opt.last : opt.to_s) } || 0
    end

    def option_label
      collection[option_index].then { |opt| opt.is_a?(Array) ? opt.first : opt.to_s }
    end
  end
end
