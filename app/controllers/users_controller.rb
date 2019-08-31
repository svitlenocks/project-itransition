class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?

  def index
    @users = User.all
  end

  def update
    @users = User.where(id: params[:users_ids])
    destroy if deleting?
    make_admin if make_admin?
    delete_admin if delete_admin?
    lock if lock?
    unlock if unlock?
    respond_to do |format|
      format.html { redirect_to users_admin_index_url }
      format.json { head :no_content }
    end
  end

  def show
    
  end

  def destroy
    redirect_to destroy_user_session_path if current_user && current_user == @users
    @users.destroy_all
  end

  def lock
    redirect_to destroy_user_session_path if current_user && current_user == @users
    update_value(:locked, lock?)
  end

  def unlock
    update_value(:locked, !unlock?)
  end

  def make_admin
    update_value(:admin, make_admin?)
  end

  def delete_admin
    update_value(:admin, !delete_admin?)
  end


  private

  def lock?
    params[:commit] == 'lock'
  end

  def update_value(column, value)
    @users.each {|user| user.update_attribute(column, value)}        
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :id)
  end

  def unlock?
    params[:commit] == 'unlock'    
  end

  def deleting?
    params[:commit] == 'delete'
  end

  def make_admin?
    params[:commit] == 'make admin'
  end

  def delete_admin?
    params[:commit] == 'delete admin'
  end

  def admin?
    if !current_user.admin
      redirect_to root_path
    end
  end

end
