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
      returned_item = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(returned_item).to have_key(:id)
      expect(returned_item[:id]).to be_a String
      expect(returned_item[:id]).to eq(created_item.id.to_s)
      expect(returned_item).to have_key(:attributes)
      expect(returned_item[:attributes][:name]).to eq(created_item.name)
      expect(returned_item[:attributes][:description]).to eq(created_item.description)
      expect(returned_item[:attributes][:unit_price]).to eq(created_item.unit_price)
      expect(returned_item[:attributes][:merchant_id]).to eq(created_item.merchant_id)
    end
  end

  xdescribe 'sad path' do
    it 'Does not create an item if attributes are missing' do
      merchant = create(:merchant)

      item_params = ({
                  name: '',
                  description: 'Really cool description',
                  unit_price: 4.5,
                  merchant_id: merchant.id
                })
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)

      created_item = Item.last
      returned_item = JSON.parse(response.body, symbolize_names: true)

      expect(response).not_to be_successful
    end
  end
end
