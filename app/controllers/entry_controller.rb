class EntryController < ApplicationController
    def thoughts
        current_user.update_attributes(thoughts: params[:user][:thoughts])
        flash[:success] = "Thoughts Updated!"
        redirect_to root_path
    end
    
    def book
        if params[:title] == nil
            flash[:warning] = "Please also check the box!"
        else
            @books = GoogleBooks.search(params[:title], {count: 1})
            @books.each do |book|
                Book.create(title: book.title, author: book.authors, pages: book.page_count, info: book.info_link, rating: book.ratings_count, user: current_user)
            end
            flash[:success] = "Selection Recommended!"
        end
        redirect_to root_path
    end
end
