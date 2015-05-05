class MainController < ApplicationController

  def index
  	@user = current_user
  end

  def picklist
    @list =  List.where(:name => params[:name]).first
    render json: @list.to_json(:include => :restaurants)
  end

  def search
    parameters = { term: 'food', limit: 20, offset: params[:offset]}
    render json: Yelp.client.search(params[:city], parameters)
  end

end
