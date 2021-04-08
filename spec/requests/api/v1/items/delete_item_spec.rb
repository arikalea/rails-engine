require 'rails_helper'

RSpec.describe "Delete item API" do
  describe 'happy path' do
    it 'deletes an item given correct id' do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      expect(Item.count).to eq(1)

      delete "/api/v1/items/#{item.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(Item.count).to eq(0)
      expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
