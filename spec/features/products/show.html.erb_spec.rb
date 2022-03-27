require 'rails_helper'

RSpec.describe "products/index/show", type: :feature do
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
      available_online: true,
      store_id: @store_1.id
    )
    @product_2 = Product.create!(
      name: "product 2",
      description: "second product",
      price: 35.04,
      quantity: 80010,
      available_online: false,
      store_id: @store_2.id
    )
  end

  it 'can display individual products and their information' do
    visit "/products/#{@product_1.id}"

    expect(page).to have_content(@product_1.name)
    expect(page).to have_content(@product_1.description)
    expect(page).to have_content(@product_1.price)
    expect(page).to have_content(@product_1.quantity)
    expect(page).to have_content(@product_1.available_online?)
    expect(page).to have_content(@store_1.name)
    expect(page).not_to have_content(@product_2.name)
    expect(page).not_to have_content(@store_2.name)
  end

  it 'displays a link to the product index' do
    visit "/products/#{@product_1.id}"

    expect(page).to have_link(href: "/products")
  end

  it 'has link to the Stores index' do
    visit "/products/#{@product_1.id}"

    expect(page).to have_link(href: "/stores")
  end

  it 'has a button to update product info' do
    visit "/products/#{@product_1.id}"
    expect(page).to have_button("Update Product")

    click_button("Update Product")
    expect(current_path).to eq("/products/#{@product_1.id}/edit")
  end

  it 'has a button to delete itself' do
    # As a visitor
    # When I visit a child show page
    # Then I see a link to delete the child "Delete Child"
    # When I click the link
    # Then a 'DELETE' request is sent to '/child_table_name/:id',
    # the child is deleted,
    # and I am redirected to the child index page where I no longer see this child
    deletable_product = @store_1.products.create(
      name: "deleteable",
      description: "deleteable product",
      price: 300.04,
      quantity: 810,
      available_online: true,
    )

    visit "/products/#{deletable_product.id}"

    expect(page).to have_content("deleteable")
    expect(page).to have_content("Description: #{deletable_product.description}")
    expect(page).to have_button("Delete deleteable")

    click_button("Delete deleteable")

    expect(current_path).to eq("/products")
    expect(page).not_to have_content("deleteable")
    expect(page).not_to have_content("Description: deleteable product")
  end
end
