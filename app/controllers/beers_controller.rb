require 'rest-client'
require 'json'
class BeersController < ApplicationController
  before_action :authenticate!
  before_action :set_beer, only: [:show, :update, :destroy]

  # GET /beers
  def index
    # @beers = Beer.all
    # render json: @beers
    response = RestClient.get('https://api.punkapi.com/v2/beers')
    results = JSON.parse(response.to_str)
    
  
    my_arr = Array.new
    results.each do |beer|
        element = { :id => beer['id'], :name => beer['name'], :tagline => beer['tagline'] , :description => beer['description'], :abv => beer['abv'] }
        my_arr.push(element)
    end
    @beers = my_arr.to_json

    render json: @beers
    # render json: {
    #   hello: @current_user.name
    # }
  end

  # GET /beers/1
  def show
    render json: @beer
  end

  # POST /beers
  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      render json: @beer, status: :created, location: @beer
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /beers/1
  def update
    if @beer.update(beer_params)
      render json: @beer
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /beers/1
  def destroy
    @beer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      response = RestClient.get('https://api.punkapi.com/v2/beers')
    results = JSON.parse(response.to_str)
    
  
    my_arr = Array.new
    results.each do |beer|
        element = { :id => beer['id'], :name => beer['name'], :tagline => beer['tagline'] , :description => beer['description'], :abv => beer['abv'] }
        my_arr.push(element)
    end

      nuevo_arr = Array.new
      
      my_arr.each do |beer|
        if beer[:id].to_s == params[:id]
          nuevo_arr.push(beer)
        end   
      end
      @beer = nuevo_arr.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def beer_params
      params.require(:beer).permit(:beer_id, :seen_at, :user_id)
    end
end
