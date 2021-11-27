class MembershipsController < ApplicationController



    def create
        new_client = Membership.create(client_params)
        if new_client 
            render json: new_client
        else  
            render json: {error: client.errors.full_messages}, status_code: :unprocessable_entity
        end
    end








    
    private 
    def membership_params 
        params.permit(:gym_id, :client_id, :charge)
    end
end
