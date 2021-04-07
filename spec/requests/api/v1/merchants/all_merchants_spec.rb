require 'rails_helper'

RSpec.describe "All Merchants API" do
  describe 'happy path' do
    it 'gives a list of all merchants' do
      create_list(:merchant, 20)

      get '/api/v1/merchants'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchants[:data].count).to eq(20)
      expect(merchants[:data].first).to have_key(:id)
      expect(merchants[:data].first[:id]).to be_a String
      expect(merchants[:data].first).to have_key(:type)
      expect(merchants[:data].first[:type]).to be_a String
      expect(merchants[:data].first).to have_key(:attributes)
      expect(merchants[:data].first[:attributes]).to be_a Hash
      expect(merchants[:data].first[:attributes]).to have_key(:name)
      expect(merchants[:data].first[:attributes][:name]).to be_a String
    end

    it 'returns 20 merchants on page 2' do
      create_list(:merchant, 50)

      get '/api/v1/merchants?per_page=20&page=2'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(20)
    end

    it 'returns a unique list of merchant results' do
      create_list(:merchant, 50)

      get '/api/v1/merchants?page=1'

      merchants_1 = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchants_1[:data].count).to eq(20)
      expect(merchants_1[:data].second[:id].to_i).to eq(merchants_1[:data].first[:id].to_i + 1)
      expect(merchants_1[:data].last[:id].to_i).to eq(merchants_1[:data].first[:id].to_i + 19)

      get '/api/v1/merchants?page=2'

      merchants_2 = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchants_2[:data].count).to eq(20)
      expect(merchants_2[:data].second[:id].to_i).to eq(merchants_2[:data].first[:id].to_i + 1)
      expect(merchants_2[:data].last[:id].to_i).to eq(merchants_2[:data].first[:id].to_i + 19)
    end
  end
  describe 'sad paths' do
    it 'defaults to page one if page requested is 0 or lower' do
      create_list(:merchant, 50)

      get '/api/v1/merchants?page=0'

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchants[:data].count).to eq(20)
      expect(merchants[:data].first).to have_key(:id)
    end
  end
end
