class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be valid email" }
    has_many :post
    has_many :collection
end
