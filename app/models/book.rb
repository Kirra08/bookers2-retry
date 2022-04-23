class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, length: {in: 2...201}
end
