class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	
	enum payment_method: { credit_card: 0, transfer: 1 }
	enum status:  { waiting_payment: 0, payment_confirmation: 1, delivery_preparation: 2, delivered: 3 }

	def total_price
		cart_items.to_a.sum { |cart_item| cart_item.total_price }
	end
	
	def claim_price
		total_price + shopping_cost
	end
end

