module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: true,
      description: "An example field added by the generator"

    field :posts, [PostType], null: true

    def posts
      user = context[:current_user]
      user ? context[:current_user].posts : []
    end

    def test_field
      "Hello World!"
    end
  end
end
