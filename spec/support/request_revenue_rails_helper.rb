module RequestRevenueRailsHelper
  def seed_test_db
    @merchant_1 = create(:merchant, name: "First one")
    @merchant_2 = create(:merchant, name: "Second one")
    @merchant_3 = create(:merchant, name: "Third one")
    @merchant_4 = create(:merchant, name: "Fourth one")
    @merchant_5 = create(:merchant, name: "Fifth one")
    @merchant_6 = create(:merchant, name: "Sixth one")
    @merchant_7 = create(:merchant, name: "Seventh one")
    @merchant_8 = create(:merchant, name: "Eigth one")
    @merchant_9 = create(:merchant, name: "Nineth one")
    @merchant_10 = create(:merchant, name: "Tenth one")

    @item_1 = create(:item, unit_price: 2, merchant: @merchant_1, name: "item_1")
    @item_2 = create(:item, unit_price: 2, merchant: @merchant_1, name: "item_2")
    @item_3 = create(:item, unit_price: 2, merchant: @merchant_1, name: "item_3")
    @item_4 = create(:item, unit_price: 2, merchant: @merchant_1, name: "item_4")
    @item_5 = create(:item, unit_price: 2, merchant: @merchant_2, name: "item_5")
    @item_6 = create(:item, unit_price: 2, merchant: @merchant_2, name: "item_6")
    @item_7 = create(:item, unit_price: 2, merchant: @merchant_2, name: "item_7")
    @item_8 = create(:item, unit_price: 2, merchant: @merchant_3, name: "item_8")
    @item_9 = create(:item, unit_price: 2, merchant: @merchant_3, name: "item_9")
    @item_10 = create(:item, unit_price: 2, merchant: @merchant_4, name: "item_10")
    @item_11 = create(:item, unit_price: 2, merchant: @merchant_4, name: "item_11")
    @item_12 = create(:item, unit_price: 2, merchant: @merchant_5, name: "item_12")
    @item_13 = create(:item, unit_price: 2, merchant: @merchant_5, name: "item_13")
    @item_14 = create(:item, unit_price: 2, merchant: @merchant_6, name: "item_14")
    @item_15 = create(:item, unit_price: 2, merchant: @merchant_6, name: "item_15")
    @item_16 = create(:item, unit_price: 2, merchant: @merchant_7, name: "item_16")
    @item_17 = create(:item, unit_price: 2, merchant: @merchant_7, name: "item_17")
    @item_18 = create(:item, unit_price: 2, merchant: @merchant_8, name: "item_18")
    @item_19 = create(:item, unit_price: 2, merchant: @merchant_9, name: "item_19")
    @item_20 = create(:item, unit_price: 2, merchant: @merchant_10, name: "item_20")

    @customer = create(:customer)

    @invoice_1 = create(:invoice, customer: @customer, merchant: @merchant_1)
  end
end
