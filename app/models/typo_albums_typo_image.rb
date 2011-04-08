class TypoAlbumsTypoImage < ActiveRecord::Base
    belongs_to :typo_album
    belongs_to :typo_image
end