class Album < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :title, :date, presence: true
end
