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
      expect(merchant).to be_a Hash
    end
  end
  describe 'sad path' do
    before(:each) do
      Merchant.destroy_all
    end

    xit 'Returns 404 if no id found' do
      get "/api/v1/merchants/1"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
    end
  end
end
