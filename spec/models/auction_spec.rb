require 'rails_helper'

RSpec.describe Auction do

describe "attributes" do  
  it {is_expected.to have_attribute :starts_at }
  it {is_expected.to have_attribute :ends_at }
  it {is_expected.to have_attribute :time_zone_id }
  it {is_expected.to have_attribute :physical_address }
  it {is_expected.to have_attribute :donation_window_ends_at}
end

describe "relationship" do
  it {is_expected.to have_many :auction_admins}

end

describe "validations" do
  it "ends_at is after starts_at" do
    subject.ends_at = DateTime.new(2017,03,20,0,0)
    subject.starts_at = subject.ends_at.advance(seconds: 1)
    subject.valid?
    expect(subject.errors[:ends_at]).to include "must be greater than starts_at"
  end

  it "starts_at is after donation_window_ends_at" do
    subject.starts_at = DateTime.new(2017,03,20,0,0)
    subject.donation_window_ends_at = subject.starts_at.advance(seconds: 1)
    subject.valid?
    expect(subject.errors[:starts_at]).to include "must be greater than donation_window_ends_at"
  end

  it "expect time_zone_id to be a valid time_zone" do
    subject.time_zone_id = "MarsTime"
    subject.valid?
    expect(subject.errors[:time_zone_id]).to include "is not included in the list"
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:auction)).to be_persisted
  end
end
end
