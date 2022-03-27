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

  it 'has a button to update the product info' do
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    visit "/stores/#{@store_1.id}/products/#{@product_1.id}"

    expect(page).to have_button("Update Product")

    click_button("Update Product")
    expect(current_path).to eq("/stores/#{@store_1.id}/products/#{@product_1.id}/edit")
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

    visit "/stores/#{@store_1.id}/products/#{deletable_product.id}"

    expect(page).to have_content("deleteable")
    expect(page).to have_content("Description: #{deletable_product.description}")
    expect(page).to have_button("Delete deleteable")

    click_button("Delete deleteable")

    expect(current_path).to eq("/stores/#{@store_1.id}/products")
    expect(page).not_to have_content("deleteable")
    expect(page).not_to have_content("Description: deleteable product")
  end
end
