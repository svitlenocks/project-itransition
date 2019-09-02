class PagesController < ApplicationController

  def home
    if current_user && current_user.locked
      redirect_to pages_lock_path
    end
  end

end
