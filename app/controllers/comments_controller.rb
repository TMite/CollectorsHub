class CommentsController < ApplicationController 
    before_action :find_post, only: [:create]
    def create
        if Current.user != nil            
            @comment = @post.comments.create(params[:comment].permit(:email, :body))
            redirect_to post_path(@post)
        else
            redirect_to post_path(@post), alert: "Please sign in or create an account"
        end
    end

    private
    def newComment
        @comment = Comment.new
    end
    def find_post
        @post = Post.find(params[:post_id])
    end
end