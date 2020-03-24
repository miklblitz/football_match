require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Match, type: :model do
  
  it { should have_many(:tags) }
  it { should have_many(:gamers).through(:teams) }
  it { should have_many(:tags).through(:gamers) }
  it { should have_and_belong_to_many(:teams) }

  it { should validate_presence_of(:name) }
end