require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Tag, type: :model do
  
  it { should belong_to(:feature) }
  it { should belong_to(:gamer) }
  it { should belong_to(:match) }
  
end