class Budget < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  has_many :budget_products
end
