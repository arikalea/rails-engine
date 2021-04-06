require 'rails_helper'

RSpec.describe "All items API" do
  describe 'happy path' do
    it 'gives a list of all items' do
      create_list(:item, 20)

      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(items[:data].count).to eq(20)
      expect(items[:data].first).to have_key(:id)
      expect(items[:data].first[:id]).to be_a String
      expect(items[:data].first[:attributes]).to be_a Hash
      expect(items[:data].first[:attributes]).to have_key(:name)
      expect(items[:data].first[:attributes][:name]).to be_a String
      expect(items[:data].first[:attributes]).to have_key(:description)
      expect(items[:data].first[:attributes][:description]).to be_a String
      expect(items[:data].first[:attributes]).to have_key(:unit_price)
      expect(items[:data].first[:attributes][:unit_price]).to be_a Float
      expect(items[:data].first[:attributes]).to have_key(:merchant_id)
      expect(items[:data].first[:attributes][:merchant_id]).to be_a Integer
    end

    it 'returns 20 items on page 2' do
      create_list(:item, 50)

      get '/api/v1/items?page=2'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(20)
    end

    it 'returns a unique list of items results' do
      create_list(:item, 50)

      get '/api/v1/items?page=1'

      items_1 = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(items_1[:data].count).to eq(20)
      expect(items_1[:data].second[:id].to_i).to eq(items_1[:data].first[:id].to_i + 1)
      expect(items_1[:data].last[:id].to_i).to eq(items_1[:data].first[:id].to_i + 19)

      get '/api/v1/items?page=2'

      items_2 = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(items_2[:data].count).to eq(20)
      expect(items_2[:data].second[:id].to_i).to eq(items_2[:data].first[:id].to_i + 1)
      expect(items_2[:data].last[:id].to_i).to eq(items_2[:data].first[:id].to_i + 19)
    end
  end

  describe 'sad path' do
    it 'defualts to page one if page requested is 0 or lower' do
      create_list(:item, 50)

      get '/api/v1/items?page=0'

      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(items[:data].count).to eq(20)
      expect(items[:data].first).to have_key(:id)
    end
  end
end
