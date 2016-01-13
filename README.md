#README

##About
Ermahgerd Berlberser is a Rails 4.2 App that translates Pokedex entries for the first 151 Pokemon to Ermahgerd, Swedish Chef, Pirate, and Elmer Fudd meme dialects. 

The deployed version is available [here](http://ermahgerdberlberser.herokuapp.com). 

##Setup

Should you want to pull down a local copy, please remember to run `rake db:seed` on the database. This populates all of the various necessary API calls. Be advised that the process may take some time as several thousand API calls will be made. 

As usual for a Rails App, `bundle install` is necessary for installing dependencies.
