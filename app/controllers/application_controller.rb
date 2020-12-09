class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= user.find_by(session_token: sessions[:session_token])
    end

    def ensure_logged_in
        redirect_to new_session_url unless self.logged_in?
    end

    def logged_in?
        !!current_user
    end

    def log_in(user)
        sessions[:session_token] = user.reset_session_token!
    end

    def log_out
        current_user.reset_session_token!
        sessions[:session_token] = nil
    end
end
