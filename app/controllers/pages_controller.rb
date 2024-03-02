class PagesController < ApplicationController
  console
  def home
    if user_signed_in?
      @unread_count = Post.unread_by(current_user).count
    else
      @unread_count = Post.count
    end
  end
end
