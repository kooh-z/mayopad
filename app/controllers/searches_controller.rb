class SearchesController < ApplicationController
  def index
    posts = Post.search do
      fulltext params[:q]
    end
    @searching_posts = posts.results
  end
end
