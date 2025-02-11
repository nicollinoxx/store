module ProductsHelper
  def review_exists?
    ! @product.reviews.exists?(user_id: Current.user.id)
  end
end
