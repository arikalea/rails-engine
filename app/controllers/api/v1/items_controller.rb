class Api::V1::ItemsController < ApplicationController
  def index
    page = params[:page] && params[:page].to_i >= 1 ? params.fetch(:page).to_i : 1
    per_page = params[:per_page] ? params.fetch(:per_page).to_i : 20
    render json: ItemSerializer.new(Item.offset((page - 1) * per_page).limit(per_page))
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(item), status: :created
    else
      render json: { message: 'Your query could not be completed' }, status: :not_acceptable
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item), status: :accepted
    else
      render json: { message: 'Your query could not be completed' }, status: :not_found
    end
  end

  def destroy
    item = Item.find(params[:id])
    Invoice.delete_one_item_invoice(item.id)
    Item.destroy(item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
