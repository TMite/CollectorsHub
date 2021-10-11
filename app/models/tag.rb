class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :posts, through: :taggings
    has_many :collections, through: :taggings
end
