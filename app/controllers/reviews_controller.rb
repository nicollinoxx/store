class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)

    if @review.save
      redirect_to @review
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(reviews_params)
      redirect_to @review
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy

    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.expect(review: [ :email, :description ])
  end
end
