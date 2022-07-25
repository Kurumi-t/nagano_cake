class OrderDetail < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :order, optional: true
  enum making_status: { production_impossible: 0, waiting_production: 1, production: 2, production_completed: 3 }

  def subtotal
    price * amount
  end
end