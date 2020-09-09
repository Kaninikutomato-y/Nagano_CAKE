module ApplicationHelper

 def price_include_tax(price)
    price = price * 1.1
    "#{price.floor}円"
 end

 def price_tax(price)
    (price * 1.1).floor
 end
end
