module AtmServicesHelper
  $currencies = {"quarters": 25 , "dimes": 10 , "nickels": 5 , "pennies": 1}
  def self.change(amount)
    remaining_amount = amount
    currency_object = $currencies.invert
    response_change={}
    while remaining_amount != 0
      currency = get_highest_currency(remaining_amount)
      if response_change.has_key?(currency_object[currency])
        response_change[currency_object[currency]]+=1
      else
        response_change[currency_object[currency]] = 1
      end
      remaining_amount = remaining_amount - currency
    end
    response_change
  end

  def self.get_highest_currency(amount)
    available_currency = $currencies.values
    index = 0
    currency = available_currency[index]
    until amount >= currency
      index = index + 1
      currency = available_currency[index]
    end
    currency
  end
end
