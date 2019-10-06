class Mutations::CreatePost < Mutations::BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
  
    field :message, String, null: true
    field :errors, [String], null: false
    field :post, Types::PostType, null: true
  
    def resolve(title:, body:)
        user = context[:current_user]

        if user
            post = Post.create title: title, body: body, user_id: user.id
            if post
                {   
                    post: post,
                    message: 'successfuully created',
                    errors: []
                }
            else
                {
                    errors: post.errors.full_messages,
                }
            end
        else 
            {
                errors: ['unauthorized access']
            }
        end
    end
end