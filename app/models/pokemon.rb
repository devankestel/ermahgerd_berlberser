class Pokemon < ActiveRecord::Base
  has_many :entries
  has_attached_file :sprite
  validates_attachment_file_name :sprite, matches: [/svg\Z/, /jpe?g\Z/]

  def select_entry(language)
    self.entries.find_by(language: language)
  end
end
