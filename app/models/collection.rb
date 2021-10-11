class Collection < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :taggings, dependent: :destroy
    # has_many :tags, through: :taggings

    # def all_tags=(names)
    #     self.tags = names.split(',').map do |name|
    #         Tag.where(Tag_Name: name).first_or_create!
    #     end
    # end

    # def all_tags
    #     tags.map(&:Tag_Name).join(', ')
    # end
end
