require 'spec_helper'

describe Product, type: :model do

  it { should validate_presence_of :title }
  it { should validate_presence_of :price }
  it { should validate_numericality_of :price }
  it { should validate_uniqueness_of :title }
  it { should validate_length_of(:title).is_at_least(5) }

  it "should have valid factory" do
    product = FactoryGirl.build(:product)
    expect(product).to be_valid
  end

  it "should require a title and a price" do
    product = FactoryGirl.build(:product, :title => "", :price => "")
    expect(product).not_to be_valid
    expect(product).to have(2).error_on(:title)
    expect(product).to have(2).error_on(:price)
    product.title = "xxxx"
    expect(product).to have(1).error_on(:title)
    product.title = "xxxxx"
    product.price = 1.0
    expect(product).to have(0).error_on(:price)
    expect(product).to be_valid
  end


end
