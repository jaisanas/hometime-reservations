class Api::ReservationsController < ApplicationController  
    def create    
        @guest = GuestService.new(params).create
        @reservation = ReservationService.new(params).create(@guest.id)
        if @reservation
            render json: "{reservation: #{@reservation.to_json}}, {guest: #{@guest.to_json}}", status: 200
        else
            render json: { message: "Oops. Error occured." }, status: 400
        end

    end
  
  end
  