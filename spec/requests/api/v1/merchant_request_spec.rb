require 'rails_helper'

RSpec.describe "Merchants API" do
  describe 'All Merchants' do
    describe 'happy path' do
      it 'gives a list of all merchants, limited to 20' do
        create_list(:merchant, 25)

        get '/api/v1/merchants'

        merchants = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
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
    end
  end
end
