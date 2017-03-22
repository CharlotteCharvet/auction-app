class Bid < ApplicationRecord
  belongs_to :user
  ["amount_dollars","place_at"].each do |required_attribute|
    validates required_attribute, presence: true
  end 
  validates :amount_dollars, numericality: {greater_than: 0}
end
