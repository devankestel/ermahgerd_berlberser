# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include ApplicationHelper
class String; include Cheferize; end

require 'paperclip/media_type_spoof_detector'         
module Paperclip         
 class MediaTypeSpoofDetector        
    def spoofed?         
      false       
    end       
  end        
end  


Pokemon.destroy_all
Description.destroy_all
Entry.destroy_all
Translation.destroy_all




pokemon_data = []
pokemon_data[0] = nil
(1..151).each do |number|
  pokemon_data[number] = HTTParty.get("http://pokeapi.co/api/v1/pokemon/#{number}/")
end

puts pokemon_data[1]["name"]

base_uri = "http://pokeapi.co"

pokemon_data.each do |pokemon|
  if pokemon #only run when array entry is not nil
    pkmn = Pokemon.create(name: pokemon["name"], 
                   number: pokemon["national_id"])
    #File.expand_path("../recipe_samples.txt", __FILE__)
    #image = File.open(File.expand_path("../../app/assets/images/#{pkmn.number}.svg", __FILE__)) 
    #pkmn.sprite = image
    #image.close
    #pkmn.save!
    desc_array = []
    pokemon["descriptions"].each do |description|
      desc = HTTParty.get(base_uri + pokemon["descriptions"][pokemon["descriptions"].index(description)]["resource_uri"])
      desc_array << desc["description"]
    end
    selected_indices = []
    while selected_indices.uniq.length < 5 do
      selected_indices << rand(0..desc_array.uniq.length-1)
    end

    selected_descriptions = []
    selected_indices.uniq.each do |index|
      selected_descriptions << desc_array.uniq[index]
    end
    selected_descriptions.each do |description|
      pkmn.descriptions.create!(text: description)
    end    
  end
end

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

@pkmn = Pokemon.all

erma_base_url = "http://ermahgerd.herokuapp.com/ternslert?"

@pkmn.each do |p|
  puts p.name
  #add in entry for each language with name and number
  chefname = "On the menu tonight, a #{p.name} stew!".to_chef
  chefnumber = "Here we have Pokedex Number: #{p.number}".to_chef
  e_ch = p.entries.create!(name: chefname,
                    number: chefnumber,
                    language: "chef")
  puts e_ch.name
  puts e_ch.number
  puts e_ch.language
  puts ""
  #API calls here
  number_query = "number=" + "pokedex+number:+" + p.number.to_s
  name_query = "name=" + "ohmygod,+a+wild+" + p.name + "!"
  erma_query = erma_base_url + number_query + "&" + name_query
  erma_result = HTTParty.get(erma_query, format: :json)
  e_er = p.entries.create!(name: erma_result["name"],
                    number: erma_result["number"],
                    language: "ermahgerd")
  puts e_er.name
  puts e_er.number
  puts e_er.language
  puts ""
  piratename = random_pirate_exclamation + " " + to_pirate("There is a") + " " + random_pirate_adjective + " " + to_pirate(p.name) + "!"
  piratenumber = to_pirate("Silly Pokedex Number: #{p.number}").titleize
  e_p = p.entries.create!(name: piratename,
                    number: piratenumber,
                    language: "pirate")
  puts e_p.name
  puts e_p.number
  puts e_p.language
  puts ""
  #wascawy stuff here
  fuddname = to_fudd("Shhh! Be verrry quiet. I'm hunting a rascally #{p.name}.")
  fuddnumber = to_fudd("Pokedex Number: #{p.number}")
  e_f = p.entries.create!(name: fuddname,
                    number: fuddnumber,
                    language: "fudd")
  puts e_f.name
  puts e_f.number
  puts e_f.language
  puts ""
  @desc = p.descriptions.all 
  @desc.each do |d|
    #add descriptions as translations here
    desc_query = "description=" + d.text.gsub("%", " percent").gsub(" ", "+")
    erma_query = erma_base_url + desc_query
    erma_result = HTTParty.get(erma_query, format: :json)
    d_er = e_er.translations.create!(text: erma_result["description"])
    puts d_er.text
    puts ""
    d_ch = e_ch.translations.create!(text: d.text.to_chef)
    puts d_ch.text
    puts ""
    d_p = e_p.translations.create!(text: to_pirate(d.text))
    puts d_p.text
    puts ""
    d_f = e_f.translations.create!(text: to_fudd(d.text))
    puts d_f.text
    puts ""

  end
end


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



# puts Ermahgerd.find_by(sprite: bulbasaur.sprite).name