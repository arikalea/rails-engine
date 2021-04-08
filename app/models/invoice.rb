class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions, dependent: :destroy
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  validates :status, presence: true

  def self.delete_one_item_invoice(item_id)
    item_invoices = Item.find(item_id).invoices
    invoice_ids = item_invoices
                  .joins(:invoice_items)
                  .select(:id)
                  .group(:id)
                  .having('count(invoice_items.item_id) <= 1')
                  .pluck(:id)
    Invoice.destroy(invoice_ids)
  end
end
