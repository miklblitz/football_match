# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MatchesController, type: :controller do

  let(:valid_attributes) do
    FactoryBot.build(:match).attributes.symbolize_keys
  end


  describe 'GET #index' do
    it 'returns a success response' do
      Match.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

end
