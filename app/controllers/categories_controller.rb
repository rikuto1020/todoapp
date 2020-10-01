class CategoriesController < ApplicationController

  def index
  end
   
  def new
    @category = Category.new
    @category.users << current_user
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, user_ids: [])
  end

end
