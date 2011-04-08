class TypoAlbum < ActiveRecord::Base
  has_many :typo_albums_typo_images
  has_many :typo_images, :through => :typo_albums_typo_images
  
  validates_uniqueness_of :title
end