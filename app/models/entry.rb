class Entry < ActiveRecord::Base
  belongs_to :pokemon
  has_many :translations

  def select_translation
    num = rand(1..2)
    if num == 1
      self.translations.first
    else
      self.translations.last
    end
  end
end
