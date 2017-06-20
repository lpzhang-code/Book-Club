class SessionsController < ApplicationController
    def create
        begin
            @user = User.from_omniauth(request.env['omniauth.auth'])
            session[:user_id] = @user.id
        rescue
            flash[:warning] = "There was an error trying to authenticate you"
        end
        redirect_to root_path
    end
    
    def destroy
        if session[:user_id] != nil
            session.delete(:user_id)
            flash[:success] = 'Bye bye!'
            redirect_to root_path
        end
    end
end
