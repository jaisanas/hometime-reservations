class Reservation < ApplicationRecord
    belongs_to :guest

    validates_presence_of :code
end
