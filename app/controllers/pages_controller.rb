class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to accounts_path(year: Date.today.year, month: Date.today.month)
    end
  end
end
