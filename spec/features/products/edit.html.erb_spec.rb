require 'rails_helper'

RSpec.describe 'Product edit' do
  before(:each) do
    @store_1 = Store.create!(
      name: "Store 1",
      description: "The store one",
      address: "123 fake st.",
      rating: 1,
      sale: false
    )
    @store_2 = Store.create!(
      name: "Store 2",
      description: "The store two",
      address: "123 real st.",
      rating: 5,
      sale: false
    )

    @product_1 = Product.create!(
      name: "product 1",
      description: "first product",
      price: 1.04,
      quantity: 1,
      on_sale: true,
      store_id: @store_1.id
    )
    @product_2 = Product.create!(
      name: "product 2",
      description: "second product",
      price: 35.04,
      quantity: 80010,
      on_sale: false,
      store_id: @store_2.id
    )
  end
  it 'has a form to edit the product' do
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information
    visit "/products/#{@product_1.id}/edit"

    expect(page).to have_field("Name", with: "#{@product_1.name}")
    expect(page).to have_field("Description", with: "#{@product_1.description}")
    expect(page).to have_field("Price", with: "#{@product_1.price}")
    expect(page).to have_field("Quantity", with: "#{@product_1.quantity}")
  end

  it 'updates information and redirects to product show page' do
    visit "products/#{@product_1.id}/edit"

    fill_in('Name', with: 'Mega Product')
    fill_in('Description', with: 'A Super Mega Product')
    fill_in('Price', with: 499.99)

    click_button "Update"

    expect(current_path).to eq("/products/#{@product_1.id}")
    expect(page).to have_content("Mega Product")
    expect(page).not_to have_content("product 1")
    expect(page).to have_content("Description: A Super Mega Product")
    expect(page).not_to have_content("first product")
  end
end
