class EntryController < ApplicationController
    def thoughts
        current_user.update_attributes(thoughts: params[:user][:thoughts])
    end
    
    def book
        puts params[:title]
    end
end
