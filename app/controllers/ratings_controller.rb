class RatingsController < ApplicationController

  before_filter :authorize

  def create

    @rating = Rating.new(rating_params)
    @rating.user_id = session[:user_id]
    @rating.product_id = params[:product_id]
    if @rating.save
      @rating.save
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to "/products/#{params[:product_id]}"
    end

  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  private

  def authorize
    if !(current_user)
      redirect_to '/'
    end
  end

  def rating_params
    params.require(:rating).permit(:description, :rating)
  end

end
