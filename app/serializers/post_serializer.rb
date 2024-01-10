class PostSerializer
  include JSONAPI::Serializer

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
  
  meta do |post|
    {
      comment_count: post.comments.count,
      like_count: post.likes.post_likes.count,
    }
  end

  attributes :content, :updated_at

  belongs_to :user, serializer: :user

  has_many :comments, serializer: :comment, if: Proc.new { |record| record.comments.any? }
  has_many :likes, if: Proc.new { |record| record.likes.any? }
  has_many :post_tags, if: Proc.new { |record| record.post_tags.any? }
  
end
