class Account < ApplicationRecord
  belongs_to :user
  enum allergy: { 無し: 0, 有り: 1, 不明: 2 }
  mount_uploader :icon, IconUploader

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :birth_date
    validates :mail,  length: { maximum: 100 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
                      uniqueness: true
    validates :address
    validates :tel, length: { maximum: 11 },
                    format: { with: /\A[0-9０-９]+\z/}
    validates :allergy
  end

  validate :date_before_today
  
  def date_before_today
    return if birth_date.blank?
    errors.add(:birth_date, "は今日以前のものを選択してください") if birth_date > Date.today
  end

  def self.find_or_create_by_email(email)
    account = find_or_initialize_by(mail: email)
    if account.new_record?
      account.save!
    end
    account
  end
end
