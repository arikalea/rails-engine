require 'rails_helper'

RSpec.describe "All items API" do
  describe 'happy path' do
    it 'gives a list of all items' do
      create_list(:item, 20)

      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)
      # require "pry";binding.pry
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(items.count).to eq(20)
      expect(items.first).to have_key(:id)
      expect(items.first[:id]).to be_a Integer
      expect(items.first).to have_key(:name)
      expect(items.first[:name]).to be_a String
      expect(items.first).to have_key(:description)
      expect(items.first[:description]).to be_a String
      expect(items.first).to have_key(:unit_price)
      expect(items.first[:unit_price]).to be_a Float
      expect(items.first).to have_key(:merchant_id)
      expect(items.first[:merchant_id]).to be_a Integer
    end
  end
end
