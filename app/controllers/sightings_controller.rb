class SightingsController < ApplicationController
    # def show
        # @sighting = Sighting.find(params[:id])
    def index
        sightings = Sighting.all
        
        # moved BELOW to serializer
        # render json: sightings.to_json(:include => {
        #     :bird => {:only => [:name, :species]},
        #     :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])

        render json: SightingSerializer.new(sightings).to_serialized_json
    end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        
        # BELOW to serializer
        # render json: sighting.to_json(:include => {
        #     :bird => {:only => [:name, :species]},
        #     :location => {:only => [:latitude, :longitude]}
        # }, :except => [:updated_at])

        render json: SightingSerializer.new(sighting).to_serialized_json
    end
end