class EntryController < ApplicationController
    def thoughts
        current_user.update_attributes(thoughts: params[:user][:thoughts])
    end
end
