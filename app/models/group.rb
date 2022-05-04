class Group < ApplicationRecord
  
  #has_many :group_users
  #has_many :users, through: :group_users
  #has_many :owner, class_name: 'User', foreign_key: 'owner_id'
  has_one_attached :image
  
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
  
  validates :name,length: {in: 2...21},  uniqueness: true
  validates :introduction, length: {maximum:50}
   
    def get_image
    (image.attached?) ? image : 'no_image.jpg'
    end
   
    def join_group(user_id)
    group_users.create(user_id: user_id)
   end 
   
   def leave_group(user_id)
    group_users.destroy(user_id: user_id).destroy
   end 
   
   def belongs?(user)
    group_users.exists?(user_id: user.id)
   end 
   
   def member?(user_id)
    group_users.include?(user_id)
   end 
   
end
