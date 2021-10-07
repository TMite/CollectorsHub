class PostsController < ApplicationController   
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    def index
      @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 9)
      
      
    end

    def new
        if Current.user == nil
            redirect_to sign_in_path, notice: "You are not signed in"
        else
            @post = Post.new
        end
    end

    def create
        @post = Post.new(post_params)
        if @post.save 
            redirect_to @post
        else
            render 'new'
        end
    end

    def show

    end
  
    def edit
    
    end

    def destroy
        if Current.user == nil || Current.user.id != @post.user_id
            redirect_to root_path, notice: "You can't delete someone elses post"
        else
            @post.destroy
            redirect_to root_path, notice: "Post Deleted"
        end

        
    end
    private

    def find_post
        @post = Post.find(params[:id])
    end
    def find_user
        @user = User.find_by(id: session[:user_id])
    end
    def post_params
        params.require(:post).permit(:title, :body, :SFW, :image, :user_id)
    end
end

