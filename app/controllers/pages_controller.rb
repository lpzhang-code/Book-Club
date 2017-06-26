class PagesController < ApplicationController
    def index
    end
    
    def post
        if request.post?
            @books = GoogleBooks.search(params[:q], {count: 5})
        end
    end
end
