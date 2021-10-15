class Api::ReservationsController < ApplicationController
    # skip_before_action :verify_authenticity_token
  
    def create
      if params[:reservation][:guest_details].present?
        # PAYLOAD 1
        # create or update guest
        FormatOne::GuestService.new(params).create # create or update guest
        # create reservation
        @reservation  = FormatOne::ReservationService.new(params).create
        @guest = Guest.find_by_email(params[:reservation][:guest_email])
      else
        # PAYLOAD 2
        # create or update guest
        FormatTwo::GuestService.new(params).create
        # create reservation
        @reservation = FormatTwo::ReservationService.new(params).create
        @guest = Guest.find_by_email(params[:guest][:email])
      end
  
      if @reservation
        render json: "{reservation: #{@reservation.to_json}}, {guest: #{@guest.to_json}}", status: 200
      else
        render json: { message: "Oops. Error occured." }, status: 400
      end
    end
  
  end
  