class User < ApplicationRecord
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, :name, :password, presence: true
    has_secure_password
    has_many :posts
end
