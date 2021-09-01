class ProfilesController < ApplicationController
    before_action :find_user, only: [:show]

    def index
    
    end
    def show

    end

    private

    def find_user
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end
end