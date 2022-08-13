class Address < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code, presence: true, format: {with: /\A[0-9-]{,14}\z/}
  
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
