class PostSerializer
  include JSONAPI::Serializer

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
  
  meta do |post|
    {
      comment_count: post.comments.count,
      like_count: post.likes.count,
    }
  end

  attributes :content, :updated_at

  belongs_to :user, serializer: :user

  has_many :tags
  
end
