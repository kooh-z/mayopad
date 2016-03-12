class BookmarksController < ApplicationController
  def show
    @bookmarks = current_user.bookmarks.paginate(page: params[:page])
  end

  def toggle
    post_id = params[:post_id]
    bookmarks = current_user.bookmarks
    if bookmarks.exists?(post: post_id)
      bookmarks.where(post: post_id).destroy
    else
      bookmarks.create(user: current_user, post: Post.find(post_id))
    end
    render nothing: true
  end
end
