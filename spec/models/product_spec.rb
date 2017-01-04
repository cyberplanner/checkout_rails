require 'spec_helper'

describe Product, type: :model do

  it "should have valid factory" do
    product = FactoryGirl.build(:product)
    expect(product).to be_valid
  end

  it "should require a title and a price" do
    product = FactoryGirl.build(:product, :title => "", :price => "")
    expect(product).not_to be_valid
    expect(product).to have(1).error_on(:title)
    expect(product).to have(2).error_on(:price)
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :price }
  it { should validate_numericality_of :price }
  it { should validate_uniqueness_of :title }

end
