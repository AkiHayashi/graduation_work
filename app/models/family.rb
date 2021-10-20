class Family < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  mount_uploader :image, IconUploader

  def invite_member(user)
    members.create(user: user)
  end

  validates :name, presence: true, length: { maximum: 50 }
end
