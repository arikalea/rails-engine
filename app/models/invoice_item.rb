# frozen_string_literal: true

class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  has_one :customer, through: :invoice
  has_many :transactions, through: :invoice
  has_one :merchant, through: :item

  validates_presence_of :quantity, :unit_price
end
