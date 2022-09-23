class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_one_attached :photo

  monetize :price_cents
  register_currency :eur
end
