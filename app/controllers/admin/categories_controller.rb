class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
    # Active Record query pulls everything from Category in database
    # Orders by id descending
    # All of this information assigned to the instance variable @categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    # Create new instance variable, takes information from category_params

    if @category.save
    # If save operation (enacted when create) is successful
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end