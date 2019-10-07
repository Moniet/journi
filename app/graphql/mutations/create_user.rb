class Mutations::CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true
  
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    field :token, String, null: false
  
    def resolve(name:, username:,password:)
      user = User.new(name: name, username: username, password: password)
      if user.save
        {
          user: user,
          errors: [],
          token: User.token(user)
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages,
        }
      end
    end
  end