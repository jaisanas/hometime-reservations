class FormatTwo::GuestService

    def initialize(params)
      @params = params
    end
  
    def create
  
      begin
  
        guest = if Guest.find_by_email(@params[:guest][:email]).present?
  
          guest = Guest.find_by_email(@params[:guest][:email])
  
          # if guest already exist (by email)
          # then add phone number to guest's phone-numbers
          phone_numbers =  @params[:guest][:phone]
          guest.update_phone_numbers(phone_numbers, 2)
  
  
        else
  
          guest = Guest.new(
                              first_name:           @params[:guest][:first_name],
                              last_name:            @params[:guest][:last_name],
                              email:                @params[:guest][:email],
                              phone_numbers:        [@params[:guest][:phone]]
                            )
          guest.save!
        end
      rescue => e
        puts e
      end
    end
  
  end