class Mutations::DeletePost < Mutations::BaseMutation
    argument :id, String, required: true
    argument :token, String, required: true
  
    field :message, String, null: true
    field :errors, String, null: true
  
    def resolve(id:, token:)
        decoded_token = JWT.decode(token, ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' })
        user = User.find decoded_token[0]["user_id"]

        if user
            posts = user.posts
            post = posts.find(id.to_i)
        
            if post.destroy
                {
                    message: 'successfuully deleted',
                }
            else
                {
                    errors: 'post was not deleted',
                }
            end
        else 
            {
                errors: 'unauthorized access'
            }
        end
    end
end