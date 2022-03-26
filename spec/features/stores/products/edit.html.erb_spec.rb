require 'rails_helper'

RSpec.describe "Store Product edit" do
  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information
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

      @product_1 = @store_1.products.create!(
        name: "product 1",
        description: "first product",
        price: 1.04,
        quantity: 1,
        on_sale: true
      )
      @product_2 = @store_2.products.create!(
        name: "product 2",
        description: "second product",
        price: 35.04,
        quantity: 80010,
        on_sale: false
      )
  end

  it 'has a form to edit product attributes' do
    visit "stores/#{@store_1.id}/products/#{@product_1.id}/edit"

    expect(page).to have_field("Name", with: "#{@product_1.name}")
    expect(page).to have_field("Description", with: "#{@product_1.description}")
    expect(page).to have_field("Price", with: "#{@product_1.price}")
    expect(page).to have_field("Quantity", with: "#{@product_1.quantity}")
  end
end
