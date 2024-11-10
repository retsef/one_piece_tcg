return if User.any?

puts 'Seeding User'
require 'faker'

user = User.create!(email: "admin@optcg.it",
                    password: "7KUQQgxOc9@7",
                    password_confirmation: "7KUQQgxOc9@7")
