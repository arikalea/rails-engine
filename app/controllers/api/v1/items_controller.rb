class Api::V1::ItemsController < ApplicationController
  def index
    page = params[:page] && params[:page].to_i >= 1 ? params.fetch(:page).to_i : 1
    per_page = params[:per_page] ? params.fetch(:per_page).to_i : 20
    render json: ItemSerializer.new(Item.offset((page - 1) * per_page).limit(per_page))
  end
end
