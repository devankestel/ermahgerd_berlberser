# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'paperclip/media_type_spoof_detector'         
module Paperclip         
 class MediaTypeSpoofDetector        
    def spoofed?         
      false       
    end       
  end        
end  


Pokemon.destroy_all

image = File.open("/Users/devankestel1/Documents/ermahgerd_berlberser/app/assets/images/1.svg")
pkmn = Pokemon.create!(name: "Bulbasaur", 
                number: 1)
pkmn.sprite = image
image.close
pkmn.save!

bulbasaur = Pokemon.find_by(number: 1)
puts bulbasaur.name

desc1 = bulbasaur.descriptions.create!(text: "Oh my god, a wild Bulbasuar!")
desc2 = bulbasaur.descriptions.create!(text: "Another Bulbasaur description.")

ermahgerd = bulbasaur.entries.create!(name: "Berlberser",
                                     language: "ermahgerd")

terns1 = ermahgerd.translations.create!(text: "Ermahgerd, a werld Berlberser!")
terns2 = ermahgerd.translations.create!(text: "Ernerther Berlberser dersrerptern.")

chef = bulbasaur.entries.create!(name: "Bulbasah",
                                     language: "chef")

bork1 = chef.translations.create!(text: "Bork Bork Bork!")
bork2 = chef.translations.create!(text: "Another Bork Bork Bork")

fudd = bulbasaur.entries.create!(name: "Buwbasaw",
                                 language: "fudd")

twan1 = fudd.translations.create!(text:  "Wewd Buwbasaw!")
twan2 = fudd.translations.create!(text: "Awnuder Buwbasaw descwiption.")

pirate = bulbasaur.entries.create!(name: "Bulbasarrr",
                                    language: "pirate")

trrran1 = pirate.translations.create!(text:  "Avast! A Bulbasarrr!")
trrran2 = pirate.translations.create!(text: "Bulbasarrr, me hardy.")
 



#Entry.destroy_all

# pokemon_data = []
# pokemon_data[0] = nil
# (1..151).each do |number|
#   pokemon_data[number] = HTTParty.get("http://pokeapi.co/api/v1/pokemon/#{number}/")
# end

# puts pokemon_data[1]["name"]

# base_uri = "http://pokeapi.co"

# pokemon_data.each do |pokemon|
#   if pokemon #only run when array entry is not nil
#     pokemon_description = HTTParty.get(base_uri + pokemon["descriptions"][0]["resource_uri"])
#     pokemon_sprite = HTTParty.get(base_uri + pokemon["sprites"][0]["resource_uri"])
#     Pokemon.create(name: pokemon["name"], 
#                    number: pokemon["national_id"],
#                    description: pokemon_description["description"],
#                    sprite: base_uri + pokemon_sprite["image"])
#   end
# end

# my_model_instance = MyModel.new
# file = File.open(file_path)
# my_model_instance.attachment = file
# file.close
# my_model_instance.save!

# pokemon_data.each do |pokemon|
#   if pokemon #only run when array entry is not nil
#     pokemon_description = HTTParty.get(base_uri + pokemon["descriptions"][0]["resource_uri"])
#     #pokemon_sprite = HTTParty.get(base_uri + pokemon["sprites"][0]["resource_uri"])
#     image = File.open("/Users/devankestel1/Documents/ermahgerd_berlberser/app/assets/images/#{pokemon["national_id"]}.svg")
#     Pokemon.create!(name: pokemon["name"], 
#                    number: pokemon["national_id"],
#                    description: pokemon_description["description"],
#                    sprite: image)
#     image.close
#   end
# end

# bulbasaur = Pokemon.find_by(number: 1)

# puts bulbasaur.description

# erma_base_url = "http://ermahgerd.herokuapp.com/ternslert?"

# Pokemon.all.each do |pokemon|
#   percent_description = pokemon.description.gsub("%", " percent")
#   plus_description = percent_description.gsub(" ", "+")
#   description_query = "description=" + plus_description
#   number_query = "number=" + "pokedex+number:+" + pokemon.number.to_s
#   name_query = "name=" + "ohmygod,+a+wild+" + pokemon.name + "!"
#   erma_query = erma_base_url + description_query + "&" + number_query + "&" + name_query
#   erma_result = HTTParty.get(erma_query, format: :json)
#   Ermahgerd.create(name: erma_result["name"],
#                    number: erma_result["number"],
#                    description: erma_result["description"],
#                    sprite: pokemon.sprite)
# end

# puts Ermahgerd.find_by(sprite: bulbasaur.sprite).name