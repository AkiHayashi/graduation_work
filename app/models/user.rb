class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :authentication_keys => [:login_name]

  has_many :members
  has_many :families, through: :members
  has_many :medical_histories, dependent: :destroy
  has_many :medication_histories, dependent: :destroy
  has_many :health_statuses, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_one :account, dependent: :destroy
  accepts_nested_attributes_for :account

  def self.guest
    find_or_create_by!(login_name: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  def self.admin_guest
    find_or_create_by!(login_name: "ゲスト管理者") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
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

  # def self.find_or_create_by_email(email)
  #   user = find_or_initialize_by(mail: email)
  #   if user.new_record?
  #     user.password = generate_password
  #     user.save!
  #   end
  #   user
  # end
end
