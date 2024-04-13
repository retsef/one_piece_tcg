module Admin::FeatureSet
  extend ActiveSupport::Concern

  included do
    helper_method :current_features, :feature_enabled?

    def current_features
      Rails.features.for(user: current_user, store: current_store)
    end

    def feature_enabled?(feature)
      current_features.enabled?(feature)
    end
  end
end
