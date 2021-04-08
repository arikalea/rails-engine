require 'rails_helper'

RSpec.describe "Get merchant with item id API" do
  describe 'happy path' do
    it 'updates an item with correct attributes' do
      merchant = create(:merchant)
      item = create(:item)
      merchant.items << item

      get "/api/v1/items/#{item.id}/merchant"

      merchant_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchant_json.count).to eq(1)
      expect(merchant_json[:data]).to be_a Hash
      expect(merchant_json[:data]).to have_key(:id)
      expect(merchant_json[:data][:id]).to be_a String
      expect(merchant_json[:data][:attributes]).to be_a Hash
      expect(merchant_json[:data][:attributes]).to have_key(:name)
      expect(merchant_json[:data][:attributes][:name]).to be_a String
    end
  end
end
