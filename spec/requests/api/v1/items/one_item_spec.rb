require 'rails_helper'

RSpec.describe "One item API" do
  describe 'happy path' do
    before(:each) do
      Item.destroy_all
      @items = create_list(:item, 20)
    end

    it 'returns one item by id' do
      get "/api/v1/items/#{@items.first.id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(item[:data]).to be_a Hash
      expect(item[:data]).to have_key(:id)
      expect(item[:data][:id]).to be_a String
      expect(item[:data]).to have_key(:attributes)
      expect(item[:data][:attributes]).to be_a Hash
      expect(item[:data][:attributes]).to have_key(:name)
      expect(item[:data][:attributes][:name]).to be_a String
      expect(item[:data][:attributes]).to have_key(:description)
      expect(item[:data][:attributes][:description]).to be_a String
      expect(item[:data][:attributes]).to have_key(:unit_price)
      expect(item[:data][:attributes][:unit_price]).to be_a Float
      expect(item[:data][:attributes]).to have_key(:merchant_id)
      expect(item[:data][:attributes][:merchant_id]).to be_a Integer
    end
  end
  describe 'sad path' do
    it 'Returns 404 if no id found' do
      get "/api/v1/items/111111"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(response).to be_not_found
    end
  end
end
