class Mutations::DeletePost < Mutations::BaseMutation
    argument :id, ID, required: true
  
    field :message, String, null: true
    field :errors, String, null: true
  
    def resolve(id:)
        user = context[:current_user]
        
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
                errors: 'unauthorized change'
            }
        end
    end
end