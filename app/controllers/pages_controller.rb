class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if user_signed_in?
      redirect_to month_path(year: Date.today.year, month: Date.today.month)
    end
  end

  def month
    @accounts = current_user.accounts
  end
end
