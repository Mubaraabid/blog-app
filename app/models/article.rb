class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  # def like_count
  #    likes.count
  # end

  def update_like_count
    update_column(:likes_count, likes.count)
  end
  
end


