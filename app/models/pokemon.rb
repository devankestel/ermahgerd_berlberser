class Pokemon < ActiveRecord::Base
  has_many :entries
  has_many :descriptions
  has_attached_file :sprite,
    :url => "/../app/assets/images/:basename.:extension",  
    :path => ":rails_root/app/assets/images/:basename.:extension"  
  validates_attachment_file_name :sprite, matches: [/svg\Z/, /jpe?g\Z/]


  def select_entry(language)
    self.entries.find_by(language: language)
  end
end
