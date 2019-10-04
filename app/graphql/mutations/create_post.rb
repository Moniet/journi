# module Mutations
#     class CreatePost < BaseMutation
#         argument :title, String, required: true
#         argument :body, String, required: true
#         argument :token, String, required: true

#         field :post, Types::PostType, null: false
#         field :errors, [String], null: false

#         def resolve(description, url, token)
#             token = 
#             post = Post.new(
#                 title: title,
#                 body: body,
#             )

#             if 
#         end
#     end
# end