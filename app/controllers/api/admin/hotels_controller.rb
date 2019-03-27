module Api
  module Admin
    # Hotels CRUD
    class HotelsController < ApplicationController
      def create
        hotel = Hotel.new(hotel_params)

        if hotel.save
          render json: hotel.as_json(only: %i[name address description geolocation]), status: :created
        else
          render json: { errors: hotel.errors.full_messages }, status: 400
        end
      end

      private

      def hotel_params
        params.permit(:name, :address, :description, :geolocation)
      end
    end
  end
end
