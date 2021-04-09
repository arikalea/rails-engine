require 'rails_helper'

RSpec.describe "Delete item API" do
  describe 'happy path' do
    it 'deletes an item given correct id' do
      item = create(:item)

      expect(Item.count).to eq(1)

      delete "/api/v1/items/#{item.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(Item.count).to eq(0)
      expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'deletes an item and invoice if only one item' do
      items = create_list(:item, 2)
      invoices = create_list(:invoice, 2)
      invoice_1 = invoices.first
      invoice_2 = invoices.last
      item_1 = items.first
      item_2 = items.last
      invoice_1.items << item_1
      invoice_2.items << [item_1, item_2]

      expect(Item.count).to eq(2)

      delete "/api/v1/items/#{item_1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(Item.count).to eq(1)
      expect{Item.find(item_1.id)}.to raise_error(ActiveRecord::RecordNotFound)
      expect{Invoice.find(invoice_1.id)}.to raise_error(ActiveRecord::RecordNotFound)
      expect(Invoice.find(invoice_2.id)).to eq(invoice_2)
    end
  end
  describe 'sad path' do
    it 'Does not delete if no item id found' do
      item = create(:item)

      expect(Item.count).to eq(1)

      delete "/api/v1/items/333"

      expect(response.status).to eq(404)
      expect(response).to be_not_found
      expect(Item.count).to eq(1)
    end
  end   
end
