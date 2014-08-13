class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    # 搜尋
    @q = Category.search(params[:q])
    @categories = @q.result(distinct: true)
  end

  def show
    @category = Category.find(params[:id])
  end

end
