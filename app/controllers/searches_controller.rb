class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = Article.ransack(params[:q])
    @articles = @search.result(distinct: true)
  end

  
end