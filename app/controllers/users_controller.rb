class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)    # Not the final implementation!
    if @user.save
      redirect_to @user
      flash[:success] = "Welcome to the sample app"
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
