class TypoAlbums < ActiveRecord::Base
  has_many :typo_images, :through => 'typo_albums_typo_images'
  
  validates_uniqueness_of :title
end