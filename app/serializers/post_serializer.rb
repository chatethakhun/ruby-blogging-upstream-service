class PostSerializer
  include JSONAPI::Serializer
  attributes :content, :create_at, :user
end
