class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    article = Article.find(params[:article_id])
    comments = article.comments.all.order(id: "DESC")
    render json: comments
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    @comment.save!
    render json: @comment
  end

  def destory
    article = Article.find(params[:article_id])
    @comment = article.current_user.comments
    @comment.destroy!
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

end