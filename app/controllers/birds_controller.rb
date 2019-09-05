class BirdsController < ApplicationController
  # before_action :setBird, only: [:show]
  def index
    birds = Bird.all
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
    # same as render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end

    # render json: {id: bird.id, name: bird.name, species: bird.species}
  end

  # private 

  # def setBird
  #   bird = Bird.find_by(id: params[:id])
  # end
end