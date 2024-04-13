class ApplicationController < ActionController::Base
  etag { Rails.application.importmap.digest(resolver: helpers) if request.format&.html? }

  include Request::Locale
  include Request::Variant
  # include Request::HoneyPot

  helper_method :current_features

  private

    def current_features
      Rails.features.for(user: current_user)
    end

    # This is a hack to avoid the missing method
    # FIXME: should be verified to not generate any side effects like sql injection
    def scoped_resource
      ApplicationRecord.none
    end
end
