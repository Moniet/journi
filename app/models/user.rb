class User < ApplicationRecord
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, :name, :password, presence: true
    has_secure_password
    has_many :posts

    def self.token(user)
        JWT.encode({user_id: user.id}, ENV['SECRET_KEY_BASE'], 'HS256')
    end
end
