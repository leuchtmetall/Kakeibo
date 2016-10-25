class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_month_and_year

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :short_name])
  end

  def set_month_and_year
    @year = (params[:year] || @year).to_i
    @year = (@year > 0) ? @year : Date.today.year
    @month = (params[:month] || @month).to_i
    @month = (@month > 0 && @month <= 12) ? @month : Date.today.month
  end
end
