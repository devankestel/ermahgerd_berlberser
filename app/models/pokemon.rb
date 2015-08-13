class Pokemon < ActiveRecord::Base
  has_many :types
  has_many :evolutions
  has_many :stats
end
