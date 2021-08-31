class PetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    pets = Pet.all
    render json: pets
  end

  def show
    pet = find_pet
    render json: pet
  end

  private

  def find_pet
    Pet.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Pet not found" }, status: :not_found
  end
end
