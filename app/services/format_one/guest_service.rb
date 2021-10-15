class FormatOne::GuestService

    def initialize(params)
      @params = params[:reservation]
    end
  
    def create
  
      begin
  
        guest = if Guest.find_by_email(@params[:guest_email]).present?
  
          guest = Guest.find_by_email(@params[:guest_email])
  
          # if guest already exist (by email)
          # then add phone number to guest's phone-numbers
          phone_numbers = @params[:guest_phone_numbers]
          guest.update_phone_numbers(phone_numbers, 1)
  
        else
  
          # create new gest
  
          guest = Guest.new(
                              first_name:           @params[:guest_first_name],
                              last_name:            @params[:guest_last_name],
                              email:                @params[:guest_email],
                              phone_numbers:        @params[:guest_phone_numbers]
                            )
          guest.save!
        end
      rescue => e
        puts e
      end
    end
  
  end