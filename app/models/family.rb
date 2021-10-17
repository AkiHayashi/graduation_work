class Family < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  mount_uploader :image, IconUploader

  def invite_member(user)
    members.create(user: user)
  end
end
