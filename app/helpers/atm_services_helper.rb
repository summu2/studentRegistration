module AtmServicesHelper
  $currency = {"quarters": 25 , "dimes": 10 , "nickels": 5 , "pennies": 1}
  def self.change(amount)
    remaining_amount = amount
    currency_object = $currency.invert
    response_change={}
    while remaining_amount != 0
      coin = get_highest_coin(remaining_amount)
      if response_change.has_key?(currency_object[coin])
        response_change[currency_object[coin]]+=1
      else
        response_change[currency_object[coin]] = 1
      end
      remaining_amount = remaining_amount - coin
    end
    response_change
  end

  def self.get_highest_coin(amount)
    available_coins = $currency.values
    index = 0
    coin = available_coins[index]
    until amount >= coin
      index = index + 1
      coin = available_coins[index]
    end
    coin
  end
end
