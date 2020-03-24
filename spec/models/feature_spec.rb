require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Feature, type: :model do
  
  it { should have_many(:tags) }
  it { should have_many(:gamers).through(:tags) }

  it { should validate_presence_of(:name) }
end