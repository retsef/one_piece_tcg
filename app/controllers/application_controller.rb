class ApplicationController < ActionController::Base
  etag { Rails.application.importmap.digest(resolver: helpers) if request.format&.html? }

  include Request::Locale
  include Request::Variant
  # include Request::HoneyPot
  include Request::VersionHeader

  include Authentication

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_features

  private

    def current_features
      Rails.features
    end

    # This is a hack to avoid the missing method
    # FIXME: should be verified to not generate any side effects like sql injection
    def scoped_resource
      ApplicationRecord.none
    end
end
