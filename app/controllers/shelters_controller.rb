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

  private

  def find_shelter
    Shelter.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Shelter not found" }, status: :not_found
  end
end
