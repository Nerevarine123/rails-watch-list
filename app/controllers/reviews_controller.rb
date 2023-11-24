class ReviewsController < ApplicationController
  # before_action :find_list, only: [:new, :create]
  before_action :find_list, only: [:create]
  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save == true
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @list = @review.list
    redirect_to list_path(@list)
  end

  private
  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
