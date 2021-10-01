class RegisterController < ApplicationController
    def new
        @user = User.new   
    end

    def create
        @user = User.new(user_params)
        name = User.find_by(email: @user.email)
        if name == nil
            @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Sucessful Sign Up"
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end