class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories/new
  def new
    @category = @account.categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @account.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @account, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @account, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to @account, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_account
      @account = current_user.accounts.find(params[:account_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = @account.categories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, proportions_attributes: [:id, :value])
    end
end
