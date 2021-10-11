class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :post, through: :taggings
    #has_many :collection, through: :taggings
end
