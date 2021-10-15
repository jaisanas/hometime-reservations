class FormatTwo::ReservationService

    def initialize(params)
      @params = params
      @guest = Guest.find_by_email(@params[:guest][:email])
    end
  
    def create
      begin
        reservation = Reservation.new(
                                        guest_id:            @guest.id,
                                        start_date:          @params[:start_date],
                                        end_date:            @params[:end_date],
                                        payout_amount:       @params[:payout_price],
                                        currency:            @params[:currency],
                                        nights:              @params[:nights],
                                        number_of_guests:    @params[:guests],
                                        status:              @params[:status],
                                        adults:              @params[:adults],
                                        children:            @params[:children],
                                        infants:             @params[:infants],
                                        security_amount:     @params[:security_price],
                                        total_amount:        @params[:total_price],
                                        code: @params[:code]
                                      )
  
        reservation.save!
      rescue => e
        return e
      end
  
      return reservation
    end
  
  end