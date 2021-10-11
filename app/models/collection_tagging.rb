class CollectionTagging < ApplicationRecord
  belongs_to :collection
  belongs_to :tag
end
