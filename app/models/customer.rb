class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

validates :postal_code, presence: true, format: {with: /\A[0-9-]{,14}\z/}
validates :telephone_number, presence: true, format: {with: /\A[0-9-]{,14}\z/}
  
  has_many :addresses, dependent: :destroy
  has_many :order_infos, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
