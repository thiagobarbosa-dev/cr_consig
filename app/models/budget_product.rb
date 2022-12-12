class BudgetProduct < ApplicationRecord
  belongs_to :budget
  belongs_to :product
  belongs_to :shipping_type
end
