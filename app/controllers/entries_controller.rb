class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account
  before_action :set_entry, only: [:edit, :update, :destroy]

  # GET /entries/new
  def new
    @entry = @account.entries.new
    @entry.init_amounts_and_items
    year = params[:year].to_i
    month = params[:month].to_i
    if year != 0 && month != 0
      @entry.month = year * 12 + month
    else
      @entry.month = Date.today.year * 12 + Date.today.month
    end
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  def create
    @entry = @account.entries.new(entry_params)
    @entry.init_amounts_and_items
    if @entry.save
      redirect_to month_path(month: @entry.real_month, year: @entry.real_year), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to month_path(month: @entry.real_month, year: @entry.real_year), notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /entries/1
  def destroy
    month = @entry.real_month
    year = @entry.real_year
    @entry.destroy
    redirect_to month_path(month: month, year: year), notice: 'Entry was successfully destroyed.' }
  end

  private

    def set_account
      @account = current_user.accounts.find(params[:account_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = @account.entries.find(params[:id])
      @entry.init_amounts_and_items
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:month, :time, :place, items_attributes: [:id, :category_id, :amount],
        amounts_attributes: [:id, :cost, :paid, :user_id])
    end
end
