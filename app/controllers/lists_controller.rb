class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save == true
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @review = Review.new(list: @list)
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
