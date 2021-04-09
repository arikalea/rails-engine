class Api::V1::Revenue::MerchantsController < ApplicationController
  def show
    render json: MerchantRevenueSerializer.new(Merchant.find(params[:id]))
  end
end
