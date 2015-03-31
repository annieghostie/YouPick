class ListsController < ApplicationController
  def new
  	@list = List.new
  end

  def create
  	@list = List.new(list_params)
  	if @list.save!
  		redirect_to lists_path
  	else
  		render 'new'
  	end
  end

  def index
  	@lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def find_users(user)
    @list = List.where(user: user)
  end

  def find_restaurants(restaurant)
    @list = List.where(restaurant: restaurant)
  end

  def update(user)
    @list = List.find(user: user)
    if @list.update_attributes(list_params)
      redirect_to list_path(@list.id)
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
  	params.require(:list).permit(:name)
  end

end

