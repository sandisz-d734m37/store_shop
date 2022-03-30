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
        available_online: true
      )
      @product_2 = @store_2.products.create!(
        name: "product 2",
        description: "second product",
        price: 35.04,
        quantity: 80010,
        available_online: false
      )
  end

  it 'shows all the product names for the store' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_content(@product_1.name)
    expect(page).not_to have_content(@product_2.name)
  end

  it 'shows all the product descriptions for the store' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_content(@product_1.description)
    expect(page).not_to have_content(@product_2.description)
  end

  it 'shows all the product prices for the store' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_content(@product_1.price)
    expect(page).not_to have_content(@product_2.price)
  end

  it 'shows all the product quantities for the store' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_content(@product_1.quantity)
    expect(page).not_to have_content(@product_2.quantity)
  end

  it 'shows all the product online availability statuses for the store' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_content(@product_1.available_online?)
    expect(page).not_to have_content(@product_2.available_online?)
  end

  it 'displays a link to the product index' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_link(href: "/products")
  end

  it 'has link to the Stores index' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_link(href: "/stores")
  end

  it 'has a link to add a new product to the store' do
    visit "/stores/#{@store_1.id}/products"

    click_button("Add product to #{@store_1.name}")

    expect(current_path).to eq("/stores/#{@store_1.id}/products/new")
  end

  it 'has links to individual product show pages' do
    visit "/stores/#{@store_1.id}/products"
    # save_and_open_page
    click_link "product 1"

    expect(current_path).to eq("/stores/#{@store_1.id}/products/#{@product_1.id}")
  end

  it 'has a button to update each product' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_button("Update #{@product_1.name}")

    click_button("Update #{@product_1.name}")

    expect(current_path).to eq("/stores/#{@store_1.id}/products/#{@product_1.id}/edit")
    expect(page).to have_field("Name", with: "#{@product_1.name}")
    expect(page).to have_field("Description", with: "#{@product_1.description}")
  end

  it 'has a buttons to delete products' do
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_button("Delete #{@product_1.name}")

    click_button("Delete #{@product_1.name}")

    expect(current_path).to eq("/stores/#{@store_1.id}/products")
    expect(page).not_to have_content(@product_1.name)
    expect(page).not_to have_content(@product_1.description)
  end

  it 'has a link to sort products alphabetically' do
    product_3 = @store_1.products.create!(
      name: "A roduct",
      description: "Z product",
      price: 1.01,
      quantity: 1,
      available_online: true
    )
    visit "stores/#{@store_1.id}/products"

    expect(@product_1.name).to appear_before(product_3.name)

    click_link("Sort products alphabetically")
    expect(current_path).to eq("/stores/#{@store_1.id}/products")

    expect(product_3.name).to appear_before(@product_1.name)
    expect(page).not_to have_content(@product_2.name)
  end

  it 'can filter products based on quantity' do
    prod_3 = @store_1.products.create!(
      name: "Product 3",
      description: "Z product",
      price: 1.01,
      quantity: 6,
      available_online: true
    )
    prod_4 = @store_1.products.create!(
      name: "Product 4",
      description: "x product",
      price: 9.01,
      quantity: 30,
      available_online: true
    )
    visit "/stores/#{@store_1.id}/products"

    expect(page).to have_content(@product_1.name)
    expect(page).to have_content(prod_3.name)
    expect(page).to have_content(prod_4.name)

    expect(page).to have_field('Only return products with quantity')
    fill_in('Only return products with quantity', with: 6)
    click_button('Filter')

    expect(current_path).to eq("/stores/#{@store_1.id}/products")

    expect(page).not_to have_content(@product_1.name)
    expect(page).to have_content(prod_3.name)
    expect(page).to have_content(prod_4.name)
  end
end
