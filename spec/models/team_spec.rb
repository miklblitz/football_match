require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Team, type: :model do
  
  it { should have_many(:gamers) }
  it { should have_and_belong_to_many(:matches) }

  it { should validate_presence_of(:name) }
end