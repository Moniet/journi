class Mutations::UpdatePost < Mutations::BaseMutation
    argument :id, String, required: true
    argument :title, String, required: true
    argument :body, String, required: true
    argument :token, String, required: true
  
    field :message, String, null: true
    field :errors, [String], null: false
  
    def resolve(id:, title:,body:, token:)
        decoded_token = JWT.decode(token, ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' })
        user = User.find decoded_token[0]["user_id"]
        

        if user
            posts = user.posts
            post = posts.find(id.to_i)
            post.update_attributes(title: title, body: body)
            if post
                {
                    message: 'successfuully updated',
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