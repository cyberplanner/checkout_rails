require 'rails_helper'

feature 'products' do
  context 'No products added yet' do
    scenario 'should display a prompt to add a product' do
      visit '/products'

      expect(page).to have_content 'No products yet'
      expect(page).to have_link 'New Product'
    end
  end

  context 'Products have been added' do

    scenario 'display products' do
      product = create(:product, title: 'Smart Hub')
      visit '/products'

      expect(page).to have_content('Smart Hub')
      expect(page).not_to have_content('No products yet')
    end
  end

  context 'creating products' do
    scenario 'prompts the admin to fill out a form, then displays the new product' do
      visit '/products'

      click_link 'New Product', :match => :prefer_exact
      fill_in 'Title', with: 'Motion Sensor'
      fill_in 'Price', with: '24.99'
      click_button 'Create Product'
      expect(page).to have_content 'Product was successfully created'
      expect(page).to have_content 'Title: Motion Sensor'
      expect(page).to have_content 'Price: 24.99'
    end
  end

  context 'viewing products' do

    scenario 'lets a user view products' do
      smoke_sensor = create(:product, title: "Smoke Sensor", price: 19.99)

      visit '/products'
      click_link 'Show Smoke Sensor'
      expect(page).to have_content 'Title: Smoke Sensor'
      expect(page).to have_content 'Price: 19.99'
      expect(current_path).to eq "/products/#{smoke_sensor.id}"
    end

  end

  context 'editing products' do

    scenario 'let the admin edit or update a product' do
      smoke_sensor = create(:product, title: "Smoke Sensor", price: 19.99)
      visit '/products'

      click_link 'Show Smoke Sensor'
      click_link 'Edit Smoke Sensor'
      fill_in 'Title', with: 'Smart Smoke Sensor 3000'
      fill_in 'Price', with: '24.99'
      click_button 'Update Product'
      expect(page).to have_content 'Smart Smoke Sensor 3000'
      expect(page).to have_content '24.99'
      expect(page).to have_content 'Product was successfully updated'
      expect(current_path).to eq "/products/#{smoke_sensor.id}"
    end

  end

  context 'deleting products' do
    scenario 'let the admin delete a product' do
      smoke_sensor = create(:product, title: "Smoke Sensor", price: 19.99)

      visit '/products'

      click_link 'Smoke Sensor'
      click_link 'Delete Smoke Sensor'
      expect(page).not_to have_content 'Smoke Sensor'
      expect(page).to have_content 'Product was successfully deleted'
    end
  end

end
