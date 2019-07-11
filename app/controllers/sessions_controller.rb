require 'pry'
class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: user_params[:name])
        if @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to new_session_path, alert: "Invalid login information"
        end
    end

    def destroy
        session.delete [:id]
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end