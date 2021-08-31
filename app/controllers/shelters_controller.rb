class SheltersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    shelter = Shelter.all
    render json: shelter
  end

  def show
    shelter = find_shelter
    render json: shelter
  end

  def create
    shelter = Shelter.create(shelter_params)
    render json: shelter, status: :created
  end

  def update
    shelter = find_shelter
    shelter.update(shelter_params)
    render json: shelter, status: :accepted
  end

  def destroy
    shelter = find_shelter
    shelter.destroy
    head :no_content
  end

  private

  def shelter_params
    params.permit(:name, :location, :capacity)
  end

  def find_shelter
    Shelter.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Shelter not found" }, status: :not_found
  end
end
