class StaticPagesController < ApplicationController
    def home
        if logged_in?
        @post = current_user.posts.build if logged_in?
        @feed_items = current_user.feed.paginate(page: params[:page])
    else
    end
    end
    def about
    end
    def contact
    end
    def help
    end

end
