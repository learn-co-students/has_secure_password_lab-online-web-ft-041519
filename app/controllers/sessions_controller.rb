class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password]) && !params[:user][:password].empty? 
      session[:user_id] = @user.id  
    end
    redirect_to '/login'
  end
end
