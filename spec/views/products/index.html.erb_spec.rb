require 'rails_helper'

RSpec.describe "products/index", type: :feature do
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

  it 'can display all products and their information' do
    visit "/products"

    expect(page).to have_content(@product_1.name)
    expect(page).to have_content(@product_1.description)
    expect(page).to have_content(@product_1.price)
    expect(page).to have_content(@product_1.quantity)
    expect(page).to have_content(@product_1.sale_status)
    expect(page).to have_content(@store_1.name)

    expect(page).to have_content(@product_2.name)
    expect(page).to have_content(@product_2.description)
    expect(page).to have_content(@product_2.price)
    expect(page).to have_content(@product_2.quantity)
    expect(page).to have_content(@product_2.sale_status)
    expect(page).to have_content(@store_2.name)
  end
end
