class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.roles << Role.find_by(name: "traveler")
      session[:user_id] = @user.id
      redirect_to user_dashboard_index_path(@user)
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user)
          .permit(
            :email, :first_name, :last_name, :password, :phone_number,
            :birthday, :profile_picture_file_name
            )
  end

end
