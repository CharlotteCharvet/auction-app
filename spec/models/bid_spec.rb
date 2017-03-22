require 'rails_helper'

RSpec.describe Bid do
it {is_expected.to belong_to :user}

["amount_dollars","place_at"].each do |attribute|
  it {is_expected.to have_attribute attribute}
end 

it "validates the amount_dollars is greater than 0" do
  subject.amount_dollars = 0
  subject.valid?
  expect(subject.errors[:amount_dollars]).to include "must be greater than 0"
  subject.amount_dollars = 1
  subject.valid?
end
end
