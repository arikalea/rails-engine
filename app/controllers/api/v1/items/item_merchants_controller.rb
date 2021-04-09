class Api::V1::Items::ItemMerchantsController < ApplicationController
  def show
    render json: MerchantSerializer.new(Item.find(params[:item_id]).merchant)
  end
end
