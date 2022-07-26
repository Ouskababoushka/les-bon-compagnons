class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  monetize :price_cents
  register_currency :eur
end
