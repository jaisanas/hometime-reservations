class FormatOne::ReservationService

    def initialize(params)
      @params = params[:reservation]
      @guest = Guest.find_by_email(@params[:guest_email])
    end
  
    def create
      begin
        reservation = Reservation.new(
                                        guest_id:            @guest.id,
                                        start_date:          @params[:start_date],
                                        end_date:            @params[:end_date],
                                        payout_amount:       @params[:expected_payout_amount],
                                        currency:            @params[:host_currency],
                                        nights:              @params[:nights],
                                        number_of_guests:    @params[:number_of_guests],
                                        status:              @params[:status_type],
                                        total_paid_amount:   @params[:total_paid_amount_accurate],
                                        adults:              @params[:guest_details][:number_of_adults],
                                        children:            @params[:guest_details][:number_of_children],
                                        infants:             @params[:guest_details][:number_of_infants],
                                        security_amount:     @params[:listing_security_price_accurate],
                                        total_amount:        @params[:total_paid_amount_accurate],
                                        code:                "jais"
                                      )
  
        reservation.save!
      rescue => e
        return false
      end
  
      return reservation
  
    end
  
  end