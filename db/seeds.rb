# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Common
def fetch_families(*names)
  names.map { |name| Family.find_or_create_by(name: name) }
end

Dir[Rails.root.join("db/seeds/*.rb")].sort.each do |seed|
  load seed
end
