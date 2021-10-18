class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :authentication_keys => [:login_name]

  has_one :account, dependent: :destroy
  accepts_nested_attributes_for :account
  has_many :members
  has_many :families, through: :members
  has_many :medical_histories, dependent: :destroy
  has_many :medication_histories, dependent: :destroy
  has_many :health_statuses, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_diaries, through: :favorites, source: :diary
  

  def self.guest
    find_or_create_by!(login_name: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    user = User.find_by(login_name: 'ゲスト') 
    return user unless user.account.nil?
    Account.create(name: "guest_account_name", icon: 'default.png', birth_date: DateTime.now - 10_000, mail: "guest@ex.com", address: "れいるず番地", tel: "0000000000", allergy: "無し", user_id: user.id)
    user
  end
  def self.admin_guest
    find_or_create_by!(login_name: 'ゲスト管理者') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
    user = User.find_by(login_name: 'ゲスト管理者') 
    return user unless user.account.nil?
    Account.create(name: "guest_admin_account_name", icon: 'default.png', birth_date: DateTime.now - 10_000, mail: "guest_admin@ex.com", address: "れいるず番地", tel: "0000000000", allergy: "無し", user_id: user.id)
    user
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def own?(object)
    id == object.user_id
  end

  def favorite(diary)
    favorites.find_or_create_by(diary: diary)
  end

  def favorite?(diary)
    favorite_diaries.include?(diary)
  end

  def unfavorite(diary)
    favorite_diaries.delete(diary)
  end

end
