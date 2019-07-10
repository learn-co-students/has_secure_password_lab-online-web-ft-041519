class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        redirect_to new_user_path if user_params[:password] != user_params[:password_confirmation] 
        user = User.create(user_params)
        session[:user_id] = user.id if user
    end

    private

        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end

end
