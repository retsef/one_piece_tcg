module Admin::Collection
  class PageInfo::Component < BaseComponent
    attr_reader :paginate_info, :item_name

    def initialize(paginate_info:, item_name: nil)
      super
      @paginate_info = paginate_info
      @item_name = item_name || I18n.t(item_name_key, count: count)
    end

    delegate :count, :pages, :from, :to, to: :paginate_info, allow_nil: true

    def item_name_key
      'helpers.page_entries.item_name'
    end

    def page_count_key
      return 'helpers.page_entries.info.no_items' if count.zero?
      return 'helpers.page_entries.info.single_page' if pages == 1

      'helpers.page_entries.info.multiple_pages'
    end
  end
end
