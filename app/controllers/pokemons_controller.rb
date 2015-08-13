class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end
  def show
    pokemon = Pokemon.find(params[:id])
    @pokemon = Ermahgerd.find_by(sprite: pokemon.sprite)
  end

end
