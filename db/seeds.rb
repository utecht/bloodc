# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

role_file = Rails.root.join('db', 'roles.yml')
roles = YAML::load_file(role_file)
roles.each do |name, values|
  Role.create!(values)
end
