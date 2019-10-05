class Mutations::CreatePost < Mutations::BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
    argument :token, String, required: true
  
    field :message, String, null: true
    field :errors, [String], null: false
    field :post, Types::PostType, null: true
  
    def resolve(title:, body:, token:)
        decoded_token = JWT.decode(token, ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' })
        user = User.find decoded_token[0]["user_id"]

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