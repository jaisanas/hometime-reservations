require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { should have_many(:reservations).dependent(:destroy) }

  it { should validate_presence_of(:email) }
end
