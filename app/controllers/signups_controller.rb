class SignupsController < ApplicationController

    def create
        new_signup = Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        render json: new_signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end

end
