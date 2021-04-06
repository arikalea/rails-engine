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
      # expect(items[:data].first).to have_key(:id)
      # expect(items[:data].first[:id]).to be_a String
    end   
  end
end
