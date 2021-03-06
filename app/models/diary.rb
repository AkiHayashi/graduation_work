class Diary < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 4000 }
end

