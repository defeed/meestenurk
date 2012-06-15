class SessionsController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :get_cart
  
  def new
    @title = t('headers.login')
    
    if current_user
      redirect_to store_url, notice: "You are already logged in."
    end
  end

  def create
    @title = t('headers.login')
    
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to store_url
    else
      flash.now.alert = "Invalid username or password! Try again."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url
  end
end
