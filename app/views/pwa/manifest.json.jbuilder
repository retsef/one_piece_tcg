json.name application_title
json.short_name application_title
json.start_url root_url
json.display 'standalone'
json.background_color '#ffffff'
json.theme_color '#ffffff'
json.description application_description

icons = []
icons << { src: image_path('favicon-16x16.png'), sizes: '16x16', type: 'image/png' }
icons << { src: image_path('favicon-32x32.png'), sizes: '32x32', type: 'image/png' }
icons << { src: image_path('brand_logo.svg'), sizes: 'any', type: 'image/svg+xml' }

json.icons icons
json.related_applications []
