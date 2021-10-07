class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :authentication_keys => [:login_name]
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
end
