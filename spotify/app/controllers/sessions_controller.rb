class SessionsController < ApplicationController

    def new
        @user = User.new

        render :new
    end 

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user 
            login(@user)
            @current_user = @user
            redirect_to user_url(@user)
        else
            raise "nah"
        end 
    end 

    def destroy
        user = current_user
        if user 
            session[:session_token] = nil
            user.reset_session_token!
            @current_user = nil
            redirect_to new_sessions_url
        else 
            raise "nah"
        end 
    end 
end
