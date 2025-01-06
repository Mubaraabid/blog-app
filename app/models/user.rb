class User < ApplicationRecord
  extend Devise::Models

  has_many :articles
  has_many :likes
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
