class Comment < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :user


  # def like_count
  #   likes.count
  # end

  def update_like_count
    update_column(:likes_count, likes.count)
  end
end

