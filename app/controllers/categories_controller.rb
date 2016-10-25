class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories/new
  def new
    @category = @account.categories.new
    @category.init_proportions
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = @account.categories.new(category_params)
    @category.init_proportions

    if @category.save
      redirect_to @account, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @account, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to @account, notice: 'Category was successfully destroyed.'
  end

  private

    def set_account
      @account = current_user.accounts.find(params[:account_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = @account.categories.find(params[:id])
      @category.init_proportions
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, proportions_attributes: [:id, :user_id, :value])
    end
end
