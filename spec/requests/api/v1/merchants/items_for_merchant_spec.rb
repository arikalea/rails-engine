require 'rails_helper'

RSpec.describe "One Merchant API" do
  describe 'happy path' do
    it 'returns all items for given merchant' do
      merchants = create_list(:merchant, 5)
      merchant = merchants.first
      items = create_list(:item, 10, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/items"

      merchant_items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchant_items[:data].count).to eq(10) 
      expect(merchant_items[:data]).to be_a Array
      expect(merchant_items[:data].first).to have_key(:id)
      expect(merchant_items[:data].first[:id]).to be_a String
      expect(merchant_items[:data].first[:attributes]).to be_a Hash
      expect(merchant_items[:data].first[:attributes]).to have_key(:name)
      expect(merchant_items[:data].first[:attributes][:name]).to be_a String
      expect(merchant_items[:data].first[:attributes]).to have_key(:description)
      expect(merchant_items[:data].first[:attributes][:description]).to be_a String
      expect(merchant_items[:data].first[:attributes]).to have_key(:unit_price)
      expect(merchant_items[:data].first[:attributes][:unit_price]).to be_a Float
      expect(merchant_items[:data].first[:attributes]).to have_key(:merchant_id)
      expect(merchant_items[:data].first[:attributes][:merchant_id]).to be_a Integer
    end
  end
end
