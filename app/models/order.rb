class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy

  def sub_total
    sum = 0
    self.line_items.each { |line_item| sum += line_item.total_price }
    return ::ApplicationController.helpers.number_to_euro(sum)
  end
end
