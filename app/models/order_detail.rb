class OrderDetail < ApplicationRecord
  
  belongs_to :order_info
  
  enum making_status: { production_not_available: 0, production_pending: 1, in_progress: 2, finished: 3 }
end
