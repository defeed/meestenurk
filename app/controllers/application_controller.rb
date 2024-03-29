class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  def get_brands_and_categories
    @brands = Brand.all
    @categories = Category.all
  end
  
  def get_cart
    @cart = current_cart
  end
  
  def get_line_items
    @line_items = current_cart.line_items
  end
  
  def get_payment_and_delivery_methods
    @payment_methods = PaymentMethod.all
    @delivery_methods = DeliveryMethod.all
  end
  
  private
  
    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?
    end
    
    def default_url_options(options = {})
      { locale: I18n.locale }
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
    def authorize
      redirect_to login_url, alert: "You need to log in to access this page." if current_user.nil?
    end
    
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
