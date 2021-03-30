class SightingSerializer
    # take in whatever variable we're dealing with in a particular action, and store it as an instance variable
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    # our data customized and ready to go as a JSON string with this!
    def to_serialized_json
        @sighting.to_json(:include => {
          :bird => {:only => [:name, :species]},
          :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at])

        # OR THIS
        # options = {
        #     include: {
        #       bird: {
        #         only: [:name, :species]
        #       },
        #       location: {
        #         only: [:latitude, :longitude]
        #       }
        #     },
        #     except: [:updated_at],
        #   }
        #   @sighting.to_json(options)
    end
end