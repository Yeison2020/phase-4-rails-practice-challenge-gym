class ClientsController < ApplicationController
    def create
        new_client = Client.create(client_params)
        if new_client 
            render json: new_client  
        else  
            render json: {error: 'Your na'}, status_code: :unprocessable_entity
        end

    end

    def index
        client = Client.all 
        if client 
            render json: client 
        else  
            render json: {error: client.errors.full_messages}, status_code: :not_found
        end
    end



    private 
    def client_params 
        params.permit(:name, :age)

    end
end
