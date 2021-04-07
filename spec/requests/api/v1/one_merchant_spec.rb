require 'rails_helper'

RSpec.describe "One Merchant API" do
  describe 'happy path' do
    before(:each) do
      Merchant.destroy_all
      @merchants = create_list(:merchant, 20)
    end

    it 'Returns one merchant by id' do
      get "/api/v1/merchants/#{@merchants.first.id}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchant[:data]).to be_a Hash
      expect(merchant[:data]).to have_key(:id)
      expect(merchant[:data][:id]).to be_a String
      expect(merchant[:data][:attributes]).to be_a Hash
      expect(merchant[:data][:attributes]).to have_key(:name)
      expect(merchant[:data][:attributes][:name]).to be_a String
    end
  end
  describe 'sad path' do
    it 'Returns 404 if no id found' do
      get "/api/v1/merchants/111111/items"

      merchant = JSON.parse(response.body, symbolize_names: true)
      
      expect(response.status).to eq(404)
      expect(response).to be_not_found
    end
  end
end
