class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :albums, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def Album.search(search)   
    if search  
      where(['title LIKE ?', "%#{search}%"])   
    else  
      all  
    end  
  end  
end
