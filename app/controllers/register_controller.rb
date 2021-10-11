class RegisterController < ApplicationController
    def new
        @user = User.new   
    end

    def create
        @user = User.new(user_params)
        email = User.find_by(email: @user.email)
        username = User.find_by(username: @user.username)
        if username == nil && email == nil
            @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Sucessful Sign Up"
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation, :SFW)
    end
end