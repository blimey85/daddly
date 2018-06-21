# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Event Categories
# Category.create([
#                          { name: 'ARTS',              cat_type: 'Event' },
#                          { name: 'CHARITY',           cat_type: 'Event' },
#                          { name: 'CLASSES',           cat_type: 'Event' },
#                          { name: 'FOOD & DRINK',      cat_type: 'Event' },
#                          { name: 'MUSIC',             cat_type: 'Event' },
#                          { name: 'NETWORKING',        cat_type: 'Event' },
#                          { name: 'OUTDOORS',          cat_type: 'Event' },
#                          { name: 'RELIGIOUS',         cat_type: 'Event' },
#                          { name: 'SPORT & WELLNESS',  cat_type: 'Event' }
#                      ])

require 'csv'

Venue.destroy_all

CSV.foreach("db/venues.csv", headers: true) do |line|
  Venue.create! line.to_hash
end