require 'rails_helper'
# User Story 5, Parent Children Index
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
RSpec.describe 'Stores products index' do
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
  
  it 'shows all the product names for the store' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_content(@product_1.name)
    expect(page).not_to have_content(@product_2.name)
  end
end