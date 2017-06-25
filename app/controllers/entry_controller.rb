class EntryController < ApplicationController
    def thoughts
        current_user.update_attributes(thoughts: params[:user][:thoughts])
    end
    
    def books
        books = GoogleBooks.search(params[:q], {count: 5})
        puts books.class
    end
end
