module BookmarksHelper
  def bookmark_icon(post, user)
    unless post.user == user
      if user.bookmarks.exists?(post: post)
        fa_icon "bookmark"
      else
      fa_icon "bookmark-o"
      end
    end
  end
end
