require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should belong_to(:guest) }

  it { should validate_presence_of(:code) }
end
