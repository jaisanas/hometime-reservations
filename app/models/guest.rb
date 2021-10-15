class Guest < ApplicationRecord
    has_many :reservations, dependent: :destroy

    validates_presence_of :email

    def update_phone_numbers(new_phone_numbers, payload)
        all_phone_numbers = if !phone_numbers.nil?
                              if payload == 1
                                phone_numbers + new_phone_numbers
                              elsif payload == 2
                                phone_numbers + [new_phone_numbers]
                              end
                            else
                              new_phone_numbers
                            end
        self.update(phone_numbers: all_phone_numbers.uniq)
        # self.update(phone_numbers: [])
      end
end
