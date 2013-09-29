class UsersController < ApplicationController

  def new
	  @user = User.new
  end

  def create
    permitted_params = params.require(:user).permit(:username, 
                                 :password, 
                                 :password_confirmation)
    @user = User.new(permitted_params)
    if @user.save then
      redirect_to @user
    else
      render 'new'
    end
  end
    
    def show 
      @user = User.find(params[:id])
      
    end

end