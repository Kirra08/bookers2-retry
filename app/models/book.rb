class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, length: {in: 2...201}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end 
end
