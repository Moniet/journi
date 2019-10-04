module Mutations
    class CreatePost< BaseMutation
      # arguments passed to the `resolved` method
      argument :title, String, required: true
      argument :body, String, required: true
  
      # return type from the mutation
      type Types::PostType
  
      def resolve(title: nil, body: nil)
        Post.create!(
          title: title,
          body: body,
        )
      end
    end
  end