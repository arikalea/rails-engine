class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def revenue
    transactions.where('transactions.result = ?', 'success')
                .pluck('sum(invoice_items.unit_price * invoice_items.quantity)')
                .first
                .round(2)
  end
end
