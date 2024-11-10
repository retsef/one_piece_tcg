module Admin::Navigation::Mobile
  class Main::Component < BaseComponent
    include ActiveLinkToHelper

    def main_entries
      @main_entries ||= admin_navigation.main_entries.sort_by(&:position)
    end

    def secondary_entries
      @secondary_entries ||= admin_navigation.secondary_entries.sort_by(&:position)
    end

    private

      def admin_navigation
        Rails.application.config.admin_navigation
      end
  end
end
