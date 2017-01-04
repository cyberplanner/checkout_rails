require 'rails_helper'

feature 'Store view' do
  context 'No products added' do
    scenario 'user visits store home and gets a welcome message' do
      visit '/'
      expect(page).to have_content "Welcome to Neos store"
      expect(page).to have_content "No products yet"
    end
  end
  context 'Products were added' do
    scenario 'user visits store home view products' do
      product = create(:product, title: 'Super awesome title', price: 1000.00)
      visit '/'
      expect(page).to have_content "Super awesome title"
      expect(page).to have_content "£1,000.00"
    end
  end
end
