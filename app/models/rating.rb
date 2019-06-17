class Rating < ActiveRecord::Base
  belongs_to :product

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates :rating, numericality: {greater_than: 0}
  validates :rating, numericality: {less_than: 6}
end
