module Types
    class PostType < BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :body, String, null: false
    end
  end