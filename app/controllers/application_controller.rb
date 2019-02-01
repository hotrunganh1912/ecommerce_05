class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  helper_method :current_order
  include SessionsHelper
  include ProductsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
