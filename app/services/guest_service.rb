class GuestService
    def initialize(params)
        @params = params
    end

    def create 
        begin 
            guest = Guest.find_by_email(email)                       
            if guest.present?
                guest.update!(first_name: first_name, last_name: last_name, phone_numbers: phone_numbers)
            else
                guest = Guest.new(
                    email:          email,
                    first_name:     first_name,
                    last_name:      last_name,
                    phone_numbers:  phone_numbers
                )

                guest.save!

                return guest
            end
        rescue => e
            puts e  
        end  

        return guest
    end 

    def first_name
        @params[:guest] && @params[:guest][:first_name] || @params[:reservation] && @params[:reservation][:guest_first_name]
    end

    def last_name 
        @params[:guest] && [:last_name] || @params[:reservation] && @params[:reservation][:guest_last_name]
    end

    def email
        @params[:guest] && @params[:guest][:email] || @params[:reservation] && @params[:reservation][:guest_email]
    end

    def phone_numbers
        phone_numbers = @params[:guest] && @params[:guest][:phone] || @params[:reservation] && @params[:reservation][:guest_phone_numbers]
        Array.wrap(phone_numbers)
    end
end