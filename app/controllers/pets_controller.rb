class PetsController < ApplicationController
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    pets = Pet.all
    render json: pets
  end

  def show
    pet = find_pet
    render json: pet
  end

  def create
    pet = Pet.create(pet_params)
    render json: pet, status: :created
  end

  def update
    pet = find_pet
    pet.update(pet_params)
    render json: pet, status: :accepted
  end

  def destroy
    pet = find_pet
    pet.destroy
    head :no_content
  end

  private

  def pet_params
    params.permit(:name, :breed, :age, :weight, :gps_chip, :shelter_id)
  end

  def find_pet
    Pet.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Pet not found" }, status: :not_found
  end
end
