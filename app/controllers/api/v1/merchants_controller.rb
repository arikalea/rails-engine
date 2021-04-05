# frozen_string_literal: true

module Api
  module V1
    class MerchantsController < ApplicationController
      def index
        merchants = MerchantFacade.all_merchants(params.fetch(:page, 1), params.fetch(:per_page, 20))
        render json: MerchantSerializer.new(merchants)
      end
    end
  end
end
