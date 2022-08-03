class OrderDetail < ApplicationRecord
  
  belongs_to :order_info
  belongs_to :item
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    item.with_tax_price * amount
  end
  

  enum making_status: { production_not_available: 0, production_pending: 1, in_progress: 2, finished: 3 }
end
