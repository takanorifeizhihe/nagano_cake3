class OrderInfo < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_deposit: 0, confirmation_of_payment: 1, under_production: 2, preparing_to_ship: 3, shipped: 4 }
end
