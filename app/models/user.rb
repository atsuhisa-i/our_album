class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :albums
  validates :name, :email, :encrypted_password, presence: true, uniqueness: true
  validates :encrypted_password, length: { minimum: 6 }
end
