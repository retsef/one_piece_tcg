module Admin::Collection
  class Pagination::Component < BaseComponent
    include Pagy::UrlHelpers

    attr_reader :paginate_info

    def initialize(paginate_info:)
      super
      @paginate_info = paginate_info
    end

    def page_url(page)
      pagy_url_for(paginate_info, page) # , html_escaped: true
    end

    def rel_for_page(page)
      return 'next' if page.next
      return 'prev' if page.prev

      ''
    end

    delegate :count, :pages, :prev, :next, :series, :label_for, to: :paginate_info, allow_nil: true, prefix: :page

    def page_next?
      paginate_info.next.present?
    end

    def page_prev?
      paginate_info.prev.present?
    end

    def page_render?
      paginate_info.pages > 1
    end
  end
end
