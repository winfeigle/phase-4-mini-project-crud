class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # INDEX /spices
    def index
        spices = Spice.all 
        render json: spices, status: :ok
    end

    # CREATE /spices
    def create
        spice = Spice.create(spices_params)
        render json: spice, status: :created
    end

    # UPDATE /spices/:id
    def update
        spice = Spice.find(params[:id])
        spice.update(spices_params)
        render json: spice, status: :accepted
    end

    # DESTROY /spices/:id
    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_not_found_response
        render json: { error: "Spice not found" }
    end
end
