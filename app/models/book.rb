class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :tag, presence: true
  validates :star, presence: true
  validates :body, length: {in: 2...201}
  
  is_impressionable counter_cache: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end 
  
  def self.looks(search, word)
    if search == "perfect_match"
     @book = Book.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
     @book = Book.where("title LIKE?", "#{word}%")
    elsif search == "backward_match"
     @book = Book.where("title LIKE?", "#%{word}")
    elsif search == "partial_match"
     @book = Book.where("title LIKE?", "#%{word}%")
    else
     @book = Book.all
    end 
  end 
  
  def self.looks_tag(word)
     @book = Book.where("tag LIKE?", "#{word}")
  end 
end
