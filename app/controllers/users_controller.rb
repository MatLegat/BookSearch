class UsersController < ApplicationController
  before_action :require_login

  def index
    @users = User.all
    # render json: @users.to_json
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to '/users', notice: 'User deleted.'
    else
      redirect_to '/users', alert: 'Couldn\'t delete user.'
    end
  end

  # Approve user
  def update
    user = User.find(params[:id])
    if user.update(approved: true)
      redirect_to '/users', notice: 'User approved.'
    else
      redirect_to '/users', alert: 'Couldn\'t approve user.'
    end
  end

  def require_login
    authenticate_user! if not user_signed_in?
  end
end
