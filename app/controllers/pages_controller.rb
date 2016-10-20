class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to month_path(year: Date.today.year, month: Date.today.month)
    end
  end

  def month
    @year = params[:year]
    @month = params[:month]
  end
end
