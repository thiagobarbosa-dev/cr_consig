class Offer < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  has_many :offer_products
end
