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

  context '#Menu, User can navigate to store homepage from anywhere' do
    scenario 'visit home' do
      visit '/'
      expect(page).to have_link 'Home'
      click_link 'Home'
      expect(current_path).to eq store_path
    end
  end
end
