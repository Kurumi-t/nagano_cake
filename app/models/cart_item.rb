class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  belongs_to :order
  
  def post_tax_price
		item.price * 1.1
	end
  
  def total_price
		post_tax_price * amount
	end
end
