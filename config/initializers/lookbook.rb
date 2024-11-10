return if Rails.env.production?

# Default lookbook paths
Rails.application.configure do
  config.lookbook.preview_paths << Rails.root.join('previews')
  config.lookbook.page_paths << Rails.root.join('docs')
end

# UI Theme Overrides
Rails.configuration.after_initialize do
  include InlineSvg::ActionView::Helpers

  Rails.application.config.tap do |config|
    config.lookbook.project_name = I18n.t('app.name')
    config.lookbook.project_logo = inline_svg_tag('brand_logo.svg')

    config.lookbook.ui_theme_overrides = {
      accent_50: '#f6eae9',
      accent_100: '#eed5d3',
      accent_200: '#ddaca7',
      accent_300: '#cc837c',
      accent_400: '#bb5a50',
      accent_500: '#aa3125',
      accent_600: '#992c21',
      accent_700: '#88271d',
      accent_800: '#762219',
      accent_900: '#661d16'
    }

    config.lookbook.preview_dipslay_options = {
      wrapper: true
    }
  end
end
