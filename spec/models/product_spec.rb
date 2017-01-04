require 'spec_helper'

describe Product, type: :model do

  it "should have valid factory" do
    expect(FactoryGirl.build(:product)).to be_valid
  end

  it "should require a title and a price" do
    expect(FactoryGirl.build(:product, :title => "")).not_to be_valid
    expect(FactoryGirl.build(:product, :price => "")).not_to be_valid
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :price }
  it { should validate_numericality_of :price }
  it { should validate_uniqueness_of :title }

end
