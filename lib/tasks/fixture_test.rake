namespace :db do
  namespace :fixtures do
    desc 'Generate fixtures from database'
    task dump: :environment do
      require 'active_record/fixtures'

      Rails.root.glob('test/fixtures/*.{yml,csv}').each do |file|
        File.delete(file)
      end

      models = [ Family, Card, Card::Family ]

      # ActiveRecord::FixtureSet.create_fixtures('test/fixtures', models.map(&:table_name))

      models.each do |model|
        fixture_file = "#{Rails.root}/test/fixtures/#{model.table_name}.yml"
        File.open(fixture_file, 'a+') do |f|
          model.find_each do |record|
            attributes = record.attributes.except('created_at', 'updated_at')
            f.puts({ "#{model.table_name.singularize}_#{record.id}" => attributes }.to_yaml.sub!(/---\s?/, "\n"))
          end
        end
      end
    end
  end
end
