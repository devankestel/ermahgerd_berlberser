class Pokemon < ActiveRecord::Base
  has_many :entries
  has_attached_file :sprite
  validates_attachment_content_type :sprite, :content_type => /\Aimage\/.*\Z/
end
