module Types
  class MutationType < Types::BaseObject
     # TODO: remove me
    field :test_field, String, null: false,
    description: "An example field added by the generator"

    field :create_user, mutation: Mutations::CreateUser
    field :login_user, mutation: Mutations::LoginUser
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :delete_post, mutation: Mutations::DeletePost

    def test_field
      "Hello World"
    end
  end
end
