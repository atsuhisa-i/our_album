class Album < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :pictures, dependent: :destroy
  validates :picture, presence: true
end
