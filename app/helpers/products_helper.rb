module ProductsHelper
  def review_exists?
    ! @product.reviews.exists?(user_id: Current.user.id) if authenticated?
  end

  def is_owner_review?(review)
    review.user_id.equal?(Current.user.id) if authenticated?
  end
end
