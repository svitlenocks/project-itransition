class PagesController < ApplicationController
  before_action :current_user?
  def home
    if current_user && current_user.locked
      redirect_to pages_lock_path
    end
  end

  def user_supported
    @compaigns = Compaign.includes(:benefits)
    @user_benefits = Benefit.where(id: current_user.benefits)
  end

  private


  def current_user?
    redirect_to root_path if !current_user
  end

end
