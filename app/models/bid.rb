class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :user
  ["amount_dollars"].each do |required_attribute|
    validates required_attribute, presence: true
  end 
  validates :amount_dollars, numericality: {greater_than: 0}


end
