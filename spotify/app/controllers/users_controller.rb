class UsersController < ApplicationController
before_action :redirect_if_logged_out
    def new
    @user = User.new
    render :new
    end 

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else 
            raise "nah"
        end 

    end 


    private

    def user_params
        params.require(:user).permit(:email, :password)
    end 
end
