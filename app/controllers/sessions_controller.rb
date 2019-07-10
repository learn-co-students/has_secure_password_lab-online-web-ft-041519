class SessionsController < ApplicationController

    def new
    end

    def create
        if params[:user]
            user = User.find_by(name: params[:user][:name])
            if user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id
            else
                return head(:forbidden)
            end
        end
    end
end