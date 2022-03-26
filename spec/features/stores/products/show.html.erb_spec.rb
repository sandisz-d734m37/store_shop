require 'rails_helper'

RSpec.describe "Store Product show page" do
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
  it 'has all products information' do
    visit "/stores/#{@store_1.id}/products/#{@product_1.id}"

    expect(page).to have_content(@product_1.name)
    expect(page).to have_content(@product_1.description)
    expect(page).to have_content(@product_1.price)
    expect(page).not_to have_content(@product_2.name)
  end
  it 'has links to go back to index pages and the unique stores products' do
    visit "/stores/#{@store_1.id}/products/#{@product_1.id}"

    expect(page).to have_link(href: "/stores")
    expect(page).to have_link(href: "/products")
    expect(page).to have_link(href: "/stores/#{@store_1.id}/products")
    expect(page).not_to have_link(href: "/stores/#{@store_2.id}/products")
  end
end
