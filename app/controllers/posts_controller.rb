class PostsController < ApplicationController   
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :find_user, only: [:others, :show, :edit, :update, :destroy]
    before_action :get_posts, only: [:index, :show, :edit, :update, :destroy]
    PostUser = "";
    def index
        if params[:q]
            params[:q][:groupings] = []
            splitTags = params[:q][:AllTags_cont].split(',')
            params[:q][:AllTags_cont].clear
            splitTags.each_with_index do |word, index|
            params[:q][:groupings][index] = {AllTags_cont: word}
            end
        end
        @q = Post.ransack(params[:q])
        @pagy, @posts = pagy(@q.result, items: 9)
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
        PostUser.replace @post.user.username
    end
  
    def edit
        
    end
    def others
        @puser = User.find_by(username: PostUser)
        render 'others'
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
        params.require(:post).permit(:title, :body, :SFW, :image, :AllTags, :all_tags, :user_id)
    end
end

