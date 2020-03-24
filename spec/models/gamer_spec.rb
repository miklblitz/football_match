require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Gamer, type: :model do
  
  it { should have_many(:tags) }
  it { should have_many(:features).through(:tags) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:age) }
end