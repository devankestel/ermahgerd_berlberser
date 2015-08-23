class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end
  def show
    @pokemon = Pokemon.find(params[:id])
    @language = params[:language] #set default language
  end

end
