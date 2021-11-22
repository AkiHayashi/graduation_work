class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :email_exist?, only: %i[create]
  before_action :user_exist?, only: %i[create]

  def create
    family = find_family(params[:family_id])
    account = email_reliable?(member_params) ? Account.find_or_create_by_email(member_params) : nil
    user = account.user
    if user
      family.invite_member(user)
      redirect_to family_url(family), notice: "メンバーを追加しました"
    else
      redirect_to family_url(family), notice: "追加できませんでした"
    end
  end

  def destroy
    member = Member.find(params[:id])
    redirect_to family_url(params[:family_id])
  end

  private

  def member_params
    params[:email]
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def user_exist?
    family = find_family(params[:family_id])
    unless Account.exists?(mail: params[:email])
    redirect_to family_url(family), notice: "この方はまだアプリを始めていません" 
    end
  end

  def email_exist?
    family = find_family(params[:family_id])
    family.users.each do |user|
      if user.account.mail.downcase == params[:email]
        redirect_to family_url(family), notice: "すでに家族に登録されています"
      elsif user.account.mail.downcase == ""
        redirect_to family_url(family), notice: "#{user.login_name} さんはメールアドレスを登録していません"
      end
    end
  end

  def find_family(family_id)
    Family.find(family_id)
  end

end
