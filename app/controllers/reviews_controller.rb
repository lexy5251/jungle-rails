class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
 protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
end

  # POST /reviews
  # POST /reviews.json
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product)
    else
      render 'show'
    end
  end


  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
