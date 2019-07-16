class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  
    @user = User.create(user_params)

    if @user.authenticate(params[:user][:password]) && !params[:user][:password].empty? && params[:user][:password] == params[:user][:password_confirmation] 
      session[:user_id] = @user.id  
    else 
      redirect_to '/signup'
      return
    end
    
    render :show
  
  end

  def show
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end 


end

