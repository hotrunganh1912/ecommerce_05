class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  helper_method :current_order

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_order
    load_order_id
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private
  def load_order_id
    session.delete(:order_id) if Order.find_by(id: session[:order_id]).nil?
  end
end
