class ApplicationComponent < ViewComponent::Base
  include Abstract

  include ViewComponentContrib::TranslationHelper
  include ViewComponentContrib::StyleVariants

  set_as_abstract_class

  private

    def identifier
      @identifier ||= self.class.name.sub('::Component', '').underscore.split('/').join('--')
    end

    def unique_id
      @unique_id ||= SecureRandom.uuid
    end

    def class_for(name, from: identifier)
      "c-#{from}-#{name}"
    end
end
