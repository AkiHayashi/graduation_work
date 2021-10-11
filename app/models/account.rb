class Account < ApplicationRecord
  belongs_to :user
  enum allergy: { 無し: 0, 有り: 1, 不明: 2 }
  mount_uploader :icon, IconUploader
end
