class Post < ApplicationRecord
    belongs_to :user
    attr_reader :title, :body

    def title=(data)
        crypt = ActiveSupport::MessageEncryptor.new(ENV['CRYPT_KEY'])
        @title = crypt.encrypt_and_sign(data)
    end

    def body=(data)
        crypt = ActiveSupport::MessageEncryptor.new(ENV['CRYPT_KEY'])
        @body = crypt.encrypt_and_sign(data)
    end
end