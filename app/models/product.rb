class Product < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates_length_of :title, minimum: 5
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
end
