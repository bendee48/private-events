class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @invited_attendances = @user.invited_attendances.includes(:event)
  end
end
