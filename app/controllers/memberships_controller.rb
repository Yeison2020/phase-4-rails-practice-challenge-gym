class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        new_membership = Membership.create(membership_params)
        if  new_membership
            render json:  new_membership
        else  
            render json: {error:  new_membership.errors.full_messages}, status_code: :unprocessable_entity
        end
    end


    def index 
        membership = Membership.all 
        render json: membership 
    end







    
    private 
    def membership_params 
        params.permit(:gym_id, :client_id, :charge)
    end
    def render_not_found_response
        render json: { error: "Membership not found" }, status: :not_found
    end

end
