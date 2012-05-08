class UsersController < Devise::SessionsController

  before_filter :authenticate_user!

  def index
    @users = Users.all
  end

  def check_email
    @user = User.find_by_email(params[:user][:email])

    respond_to do |format|
      format.json { render :json => !@user }
    end
  end

  def insta_check
    result = current_user.instapaper_user?
    respond_to do |format|
      format.js { render :json => result, :callback => params[:callback] }
    end
  end

end
