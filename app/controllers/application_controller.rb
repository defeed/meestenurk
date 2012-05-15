class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def get_brands_and_categories
    @brands = Brand.all
    @categories = Category.all
  end
  
  private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
    def authorize
      redirect_to login_url, alert: "You need to log in to access this page." if current_user.nil?
    end
end
