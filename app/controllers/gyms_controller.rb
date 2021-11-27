class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def show 
        gym  = Gym.find(params[:id])
        render json: gym
    end

    def destroy 
        client_membership = Gym.find(params[:id])
        render json: {
            gym: 'Your Membership have been deleted Thank you We hope to see you soon'
        }
    end


    
  def render_not_found_response
    render json: { error: "Gym not found" }, status: :not_found
  end

end
