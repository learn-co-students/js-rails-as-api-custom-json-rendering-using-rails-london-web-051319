class BirdsController < ApplicationController

  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at] // could achieve the same output but with an exclusion method rather than inclusion.
    # render json: birds.to_json(except: [:created_at, :updated_at]) // written in a different way.
    # render json: birds // shows all information for all birds in the database
  end

def show
   bird = Bird.find(params[:id])
   if bird
      render json: {id: bird.id, name: bird.name, species: bird.species }
      # render json: bird.slice(:id, :name, :species) // Does the same thing
      # render json: bird  // does all of the info included in the database for bird
   else
      render json: {message: 'Bird does not exist.'}
   end
end

end
