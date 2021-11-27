class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index 
        gyms = Gym.all 
        render json: gyms
    end
    def show 
        gym  = Gym.find(params[:id])
        render json: gym
    end
    
    def create
        new_gym = Gym.create(gym_params)
        if new_gym 
            render json: new_gym 
        else   
            render json: {error: 'Sorry the name or address of your request does not match our database'}, status_code: :unprocessable_entity
        end
            



    end 

    def destroy 
        client_membership = Gym.find(params[:id])
        render json: {
            gym: 'Your Membership have been deleted Thank you We hope to see you soon'
        }
    end


    private 


    def gym_params 
        params.permit(:name, :address)

    end
    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end

end
