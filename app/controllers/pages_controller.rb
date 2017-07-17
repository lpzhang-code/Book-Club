class PagesController < ApplicationController
    def index
        if current_user
            following_ids = current_user.following_ids
            @books = Book.where("user_id IN(?)", following_ids).paginate(page: params[:page], per_page: 6)
        end
    end
    
    def post
        if request.post?
            @books = GoogleBooks.search(params[:q], {count: 5})
        end
    end
    
    def explore
        @books = Book.take(5)
        @users = User.paginate(page: params[:page], per_page: 6)
    end
    
    def user
        @user = User.find(params[:id])
        @books = @user.books.paginate(page: params[:page], per_page: 4)
    end
    
    def following
        @title = "Following"
        @user = User.find(params[:id])
        @users = @user.following
        render 'show_follow'
    end
    
    def followers
        @title = "Followers"
        @user = User.find(params[:id])
        @users = @user.followers
        render 'show_follow'
    end
end
