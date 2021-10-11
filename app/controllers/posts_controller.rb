class PostsController < ApplicationController   
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :get_posts, only: [:change, :index, :show, :edit, :update, :destroy]
    #@switch = false
    def index
        @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 9)
        #@pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 9)
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
    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    def destroy
        if Current.user == nil || Current.user.id != @post.user_id
            redirect_to root_path, notice: "You can't delete someone elses post"
        else
            @post.destroy
            redirect_to root_path, notice: "Post Deleted"
        end      
    end

    #   def change
    #       @posts.each do |post|
    #           #post.toggle!(:SFW)
    #           post.update(SFW: !post.SFW?)
    #       end
    #       #redirect_to posts_path
    #       @pagy, @posts = pagy(Post.all.where(SFW: true).order("created_at DESC"), items: 9)
    #       render 'index'
    #   end
    def change
        Current.user.update(SFW: !Current.user.SFW)
        if Current.user.SFW == true
            @pagy, @posts = pagy(Post.all.where(SFW: true).order("created_at DESC"), items: 9)
        else
            @pagy, @posts = pagy(Post.all.where(SFW: false).order("created_at DESC"), items: 9)
        end
        render 'index'
    end
    private

    def find_post
        @post = Post.find(params[:id])
    end
    def find_user
        @user = User.find_by(id: session[:user_id])
    end
    def get_posts
        @pagy, @posts = pagy(Post.all.order("created_at DESC"), items: 9)
    end
    def post_params
        params.require(:post).permit(:title, :body, :SFW, :image, :all_tags, :user_id)
    end
end

