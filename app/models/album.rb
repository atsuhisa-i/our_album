class Album < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :title, :date, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, length: { maximum: 1000 }
end
