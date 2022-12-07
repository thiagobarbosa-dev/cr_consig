class OfferProduct < ApplicationRecord
  belongs_to :offer
  belongs_to :product
  belongs_to :shipping_type
end
