class RestaurantsController < ApplicationController
  def new
  	@restaurant = Restaurant.new
  end

  def create
    if Restaurant.where(:yelp_id => params[:yelp_id]).blank?
    	@restaurant = Restaurant.new(restaurant_params)
      @restaurant.lists << current_user.lists.where(:name => params[:listname]).first
    	@restaurant.save
    else
      @restaurant = Restaurant.where(:yelp_id => params[:yelp_id]).first
      @restaurant.lists << current_user.lists.where(:name => params[:listname]).first
    end
    redirect_to root_path
  end

  def index
  	@restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant.id)
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
  	params.permit(:name, :link, :yelp_id, :image_url, :address, :rating_img_url, :review_count, :listname)
  end

end
