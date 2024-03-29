class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags

  has_many :likes, as: :likeable

  validates :content, presence: true

end
