class Mutations::UpdatePost < Mutations::BaseMutation
    argument :id, String, required: true
    argument :title, String, required: true
    argument :body, String, required: true
    argument :token, String, required: true
  
    field :message, String, null: true
    field :errors, [String], null: false
  
    def resolve(id:, title:,body:, token:)
        loggedIn =  JWT.decode(token, ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' })
        if loggedIn
            post = Post.find(id.to_i)
            post.update_attributes(title: title, body: body)

            if post
                {
                    message: 'successfuully created',
                    errors: []
                }
            else
                {
                    errors: user.errors.full_messages,
                }
            end
        end
    end
end