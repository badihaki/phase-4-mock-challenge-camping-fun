class CampersController < ApplicationController
    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperAndActivitiesSerializer, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Camper not found"}, status: :not_found
    end

    def create
        camper = Camper.create!(name: params[:name], age: params[:age])
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end

end
