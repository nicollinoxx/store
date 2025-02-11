class ReviewsController < ApplicationController
  include ProductScoped
  before_action :set_review, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @review = @product.reviews.build
  end

  def create
    @review = @product.reviews.build(reviews_params)

    if @review.save
      redirect_to product_review_url(@product, @review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(reviews_params)
      redirect_to product_review_url(@product, @review)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy

    redirect_to product_url(@product)
  end

  private

  def set_review
    @review = @product.reviews.find(params[:id])
  end

  def reviews_params
    user = Current.user if authenticated?
    params.require(:review).permit(:description).merge(user_id: user.id, email: user.email_address)
  end
end
