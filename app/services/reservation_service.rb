class ReservationService
    def initialize(params)
        @params = params
    end

    def create(guest_id)
        begin
            reservation = Reservation.find_by(code: code)
            if reservation.present?
                reservation.update!(status: status, number_of_guests: number_of_guests)
            else
                reservation = Reservation.new(
                    guest_id:           guest_id,
                    start_date:         start_date,
                    end_date:           end_date,
                    payout_amount:      payout_amount,
                    currency:           currency,
                    nights:             nights,
                    number_of_guests:   number_of_guests,
                    status:             status,
                    adults:             adults,
                    children:           children,
                    infants:            infants,
                    security_amount:    security_amount,
                    total_amount:       total_amount,
                    code:               code
                )

                reservation.save!
                
                return reservation
            end
        rescue => e
            puts e
        end

        return reservation
    end 

    def code 
        @params[:reservation_code] || @params[:reservation] && @params[:reservation][:code] 
    end

    def start_date
        @params[:start_date] || @params[:reservation] && @params[:reservation][:start_date]
    end 

    def end_date
        @params[:end_date] || @params[:reservation] && @params[:reservation][:end_date]
    end 

    def payout_amount 
        @params[:payout_price] || @params[:reservation] && @params[:reservation][:expected_payout_amount] 
    end 

    def currency
        @params[:currency] || @params[:reservation] && @params[:reservation][:host_currency]
    end 

    def nights
        @params[:nights] || @params[:reservation] && @params[:reservation][:nights]
    end

    def number_of_guests
        @params[:guests] || @params[:reservation] && @params[:reservation][:number_of_guests]
    end

    def status
        @params[:status] || @params[:reservation] && @params[:reservation][:status_type]
    end

    def adults
        @params[:adults] || @params[:reservation] && @params[:reservation][:guest_details][:number_of_adults]
    end

    def children
        @params[:children] || @params[:reservation] && @params[:reservation][:guest_details][:number_of_children]
    end

    def infants
        @params[:infants] || @params[:reservation] && @params[:reservation][:guest_details][:number_of_infants]
    end

    def security_amount
        @params[:security_price] || @params[:reservation] &&  @params[:reservation][:listing_security_price_accurate]
    end

    def total_amount
        @params[:total_price] || @params[:reservation] && @params[:reservation][:total_paid_amount_accurate]
    end
end         