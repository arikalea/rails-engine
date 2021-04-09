require 'rails_helper'

RSpec.describe "Total revenue for one merchant API" do
  describe 'happy path' do
    before(:each) do
      seed_test_db
    end

    it 'Returns total revenue for one merchant by correct id' do
      get "/api/v1/revenue/merchants/#{@merchant_1.id}"

      merchant = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchant[:data]).to be_a Hash
      expect(merchant[:data]).to have_key(:id)
      expect(merchant[:data][:id]).to be_a String
      expect(merchant[:data][:attributes]).to be_a Hash
      expect(merchant[:data][:attributes]).to have_key(:revenue)
      expect(merchant[:data][:attributes][:revenue]).to be_a Float
    end
  end
end
