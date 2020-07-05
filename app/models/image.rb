class Image < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :picture, presence: true
end
