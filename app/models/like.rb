class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  scope :post_likes, -> { where(likeable_type: 'Post') }
  scope :comment_likes, -> { where(likeable_type: 'Comment') }
end
