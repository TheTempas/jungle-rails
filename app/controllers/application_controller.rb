class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # Without @ new variable every time method is called (want @ to make faster)
    # Whenever want to access user want to call ^ method.
    # After ||= finding user corresponding to current session
  end
  helper_method :current_user
  # helper_method in Rails is method you can access in controller and views.
  # If you look in _top_nav.html.erb, calling this method


  def authorize
    redirect_to '/login' unless @current_user
    end

  private

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

end