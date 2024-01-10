class CommentSerializer
  include JSONAPI::Serializer
  
  belongs_to :user

  attributes :content, :updated_at
end
