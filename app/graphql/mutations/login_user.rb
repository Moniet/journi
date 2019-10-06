require 'byebug'

class Mutations::LoginUser < Mutations::BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true
  
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    field :token, String, null: true
  
    def resolve(username:,password:)
        user = User.find_by(username: username)
        if user && user.authenticate(password)
            {
                user: user,
                errors: [],
                token: User.token(user),
            }
        else
            {
                user: nil,
                errors: 'user doesnt exist',
            }
        end
    end
  end