json.meta do
  json.comment_count post.comments.count
  json.like_count post.likes.count
end
json.id post.id
json.content post.content
json.tags post.tags
json.creator do
  json.partial! 'api/users/user', as: :creattor, user: post.user
end