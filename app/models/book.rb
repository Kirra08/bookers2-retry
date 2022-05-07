class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :tag, presence: true
  validates :star, presence: true
  validates :body, length: {in: 2...201}
  
  is_impressionable counter_cache: true
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_week, -> { where(created_at: Time.zone.now.all_week) } # 今週
  scope :created_last_week, -> { where(created_at: 1.week.ago.all_week) } # 先週
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } # 6日前
  
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
