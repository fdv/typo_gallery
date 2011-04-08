class TypoImage < ActiveRecord::Base
  has_many :typo_albums_typo_images
  has_many :typo_albums, :through => :typo_albums_typo_images
end