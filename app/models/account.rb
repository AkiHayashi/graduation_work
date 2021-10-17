class Account < ApplicationRecord
  belongs_to :user
  enum allergy: { 無し: 0, 有り: 1, 不明: 2 }
  mount_uploader :icon, IconUploader

  def self.find_or_create_by_email(email)
    account = find_or_initialize_by(mail: email)
    if account.new_record?
      account.save!
    end
    account
  end
end
