class Mutations::UpdatePost < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :body, String, required: true
  
    field :message, String, null: true
    field :errors, [String], null: false
  
    def resolve(id:, title:, body:)
        user = context[:current_user]
        if user
            posts = user.posts
            post = posts.find(id.to_i)
            post.update_attributes(id: id.to_i, title: title, body: body)
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
                errors: ['unauthorized change']
            }
        end
    end
end