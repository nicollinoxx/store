module ProductScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_product
  end

  private

  def set_product
    @product = Product.find(params[:product_id]) if params[:product_id].present?
  end
end
