module ApplicationHelper
  def number_to_euro(amount)
    number_to_currency(amount, unit: '€') #.gsub(' ',nbsp)
  end
end
