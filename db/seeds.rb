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

Ingredient.destroy_all

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

cocktail_names = ['Bloody Mary', 'Manhattan', 'Long Island Iced Tea']

cocktail_images = ['https://images.media-allrecipes.com/userphotos/250x250/5365209.jpg', 'https://www.thespruceeats.com/thmb/BNPaI7OKNBCAZ2jbufn4slWBUN8=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/blue-margarita-recipe-760849-9_preview-5b16da5c31283400365c7c41.jpeg', 'https://www.thespruceeats.com/thmb/8k4k1ZurMuWQG3KJmMhE-jQxS5c=/2048x1365/filters:fill(auto,1)/tequila-sunrise-recipe-760754-19_preview-5b02f856119fa80037651942.jpeg', 'https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/mojito-cocktails.jpg', 'https://viralhamster.com/wp-content/uploads/2017/05/8888.jpg']

puts "Destroying cocktails"

Cocktail.destroy_all

cocktail_names.each do |cocktail|
    cocktail = Cocktail.new(name: cocktail)
    file = URI.open(cocktail_images.sample)
    cocktail.save
    cocktail.photo.attach(io: file, content_type: 'image/jpg', filename: 'newCocktail')
  end

