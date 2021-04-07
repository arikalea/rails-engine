require 'rails_helper'

RSpec.describe "Create item API" do
  describe 'happy path' do
    it 'creates a new item with correct attributes' do
      merchant = create(:merchant)

      item_params = ({
                  name: 'New item',
                  description: 'Really cool description',
                  unit_price: 4.5,
                  merchant_id: merchant.id
                })
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)
      created_item = Item.last

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(created_item.name).to eq(item_params[:name])
      expect(created_item.description).to eq(item_params[:description])
      expect(created_item.unit_price).to eq(item_params[:unit_price])
      expect(created_item.merchant_id).to eq(item_params[:merchant_id])
    end
  end
end
