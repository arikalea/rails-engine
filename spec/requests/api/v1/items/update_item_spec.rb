require 'rails_helper'

RSpec.describe "Update item API" do
  describe 'happy path' do
    it 'updates an item with correct attributes' do
      merchant = create(:merchant)
      original_item = create(:item, merchant_id: merchant.id)

      new_params = ({
                  name: 'New item',
                  description: 'Really cool description',
                  unit_price: 4.5,
                  merchant_id: merchant.id
                })
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/items/#{original_item.id}", headers: headers, params: JSON.generate(item: new_params)

      returned_item = JSON.parse(response.body, symbolize_names: true)[:data]
      expected = Item.find_by(id: original_item.id)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(expected.name).to_not eq(original_item.name)
      expect(expected.name).to eq(new_params[:name])
    end
  end
end
