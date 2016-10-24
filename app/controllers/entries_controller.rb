class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

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
  # POST /entries.json
  def create
    @entry = @account.entries.new(entry_params)
    @entry.init_amounts_and_items
    respond_to do |format|
      if @entry.save
        format.html { redirect_to accounts_path(month: @entry.real_month, year: @entry.real_year), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to accounts_path(month: @entry.real_month, year: @entry.real_year), notice: 'Entry was successfully created.' }
        # format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
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
