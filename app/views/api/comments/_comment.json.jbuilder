json.id comment.id
json.content comment.content
json.post do
  json.partial! 'api/posts/post', as: :post, post: comment.post
end
json.creator do
  json.partial! 'api/users/user', as: :creator, user: comment.user
end
json.created_at comment.created_at
json.updated_at comment.updated_at