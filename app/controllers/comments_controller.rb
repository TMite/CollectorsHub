class CommentsController < ApplicationController 
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:email, :body))
        redirect_to post_path(@post)
    end

    private
    def newComment
        @comment = Comment.new
    end
end