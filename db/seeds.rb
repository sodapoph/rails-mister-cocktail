# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
raw_data = open(url).read
raw_arr = JSON.parse(raw_data)
ingredients = raw_arr['drinks'].map { |ing| ing['strIngredient1'] }

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end
