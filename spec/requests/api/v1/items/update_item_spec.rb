require 'rails_helper'

RSpec.describe "Update item API" do
  describe 'happy path' do
    it 'updates an item with correct attributes' do
      merchant = create(:merchant)
      original_item = create(:item, merchant_id: merchant.id)

      new_params = ({
                  name: 'New item',
                })
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/items/#{original_item.id}", headers: headers, params: JSON.generate(item: new_params)

      expected = Item.find_by(id: original_item.id)

      expect(response).to be_successful
      expect(response.status).to eq(202)
      expect(expected[:name]).to_not eq(original_item.name)
      expect(expected[:name]).to eq(new_params[:name])
    end
  end
  describe 'sad path' do
    it 'Returns 404 if no item id found' do
      merchant = create(:merchant)
      original_item = create(:item, merchant_id: merchant.id)

      new_params = ({
                  name: 'New item',
                })
      patch "/api/v1/items/333", headers: headers, params: JSON.generate(item: new_params)

      expect(response.status).to eq(404)
      expect(response).to be_not_found
    end

    it 'Returns 404 if no merchant id found' do
      merchant = create(:merchant)
      original_item = create(:item, merchant_id: merchant.id)
      new_params = ({
                  merchant_id: 333,
                })
      patch "/api/v1/items/333", headers: headers, params: JSON.generate(item: new_params)

      expect(response.status).to eq(404)
      expect(response).to be_not_found
    end
  end
end
