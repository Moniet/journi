module Types
    class UserType < BaseObject
      field :name, String, null: false
      field :posts, [Types::PostType], null: true
    end
end