class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: {id: bird, name: bird.name, species: bird.species }
    begin
      render json: { message: 'Bird not found'}
    rescue => exception
      
    else
      
    end
    # render json: bird.slice(:id, :name, :species)
    # render json: birds, only: [:id, :name, :species]
  end
end