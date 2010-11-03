require 'spec_helper'

describe Business do
  it "should create a calendar" do
    b = Factory(:business)
    assert b.calendar.nil? == false
  end
end
