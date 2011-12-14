class UsersController < Devise::SessionsController

  before_filter :authenticate_user!

  def index
    @users = Users.all
  end

end
