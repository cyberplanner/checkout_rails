require 'spec_helper'

describe Product, type: :model do

  it "should have valid factory" do
    expect(FactoryGirl.build(:product)).to be_valid
  end

  it "should require a username" do
    expect(FactoryGirl.build(:product, :title => "")).not_to be_valid
  end

end
