class PagesController < ApplicationController
    def index
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
end
