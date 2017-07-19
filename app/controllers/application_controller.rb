class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticated_user, only: [:post, :thoughts, :book, :relationships]
    
    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def authenticated_user
        if session[:user_id] == nil
            flash[:danger] = 'You need to log in'
            redirect_to root_path
        end
    end
    helper_method :current_user
end
