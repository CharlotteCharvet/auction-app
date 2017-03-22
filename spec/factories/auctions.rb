FactoryGirl.define do
  factory :auction do
    starts_at "2017-03-20 14:34:30"
    ends_at "2017-03-20 15:34:30"
    time_zone_id "America/New_York"
    physical_address "123 Main St\nAnytown, NY 12121 USA"
    name "2017 Auction"
    donation_window_ends_at "2017-03-19 14:34:30"
  end
end
