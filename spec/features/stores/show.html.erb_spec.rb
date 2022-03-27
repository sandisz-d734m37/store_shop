require 'rails_helper'

RSpec.describe 'Store show page', type: :feature do
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

    @prod_1 = Product.create!(
      name: 'product one',
      description: 'Test product',
      price: 100.00,
      quantity: 5,
      available_online: false,
      store_id: @store_2.id
    )
    @prod_2 = Product.create!(
      name: 'product two',
      description: 'Test product number two',
      price: 1300.00,
      quantity: 1,
      available_online: false,
      store_id: @store_2.id
    )
    @prod_3 = Product.create!(
      name: 'product three',
      description: 'Test product number two',
      price: 1300.00,
      quantity: 1,
      available_online: false,
      store_id: @store_1.id
    )
  end

  it 'can list store attributes' do
    visit "stores/#{@store_1.id}"

    expect(page).to have_content(@store_1.name)
    expect(page).to have_content(@store_1.description)
    expect(page).to have_content(@store_1.address)
    expect(page).to have_content(@store_1.rating)
    expect(page).to have_content(@store_1.sale_status)
  end

  it "displays the store's product count" do
    visit "stores/#{@store_2.id}"

    expect(page).to have_content("Total products: #{@store_2.product_count}")
  end

  it 'displays a link to the product index' do
    visit "/stores/#{@store_1.id}"

    expect(page).to have_link(href: "/products")
  end

  it 'displays a link to the stores index' do
    visit "/stores/#{@store_1.id}"

    expect(page).to have_link(href: "/stores")
  end

  it 'displays a link to the stores product index' do
    visit "/stores/#{@store_1.id}"

    expect(page).to have_link(href: "#{@store_1.id}/products")
  end

  it 'has a link to update the stores info' do
    visit "/stores/#{@store_1.id}"

    expect(page).to have_link(href: "/stores/#{@store_1.id}/edit")
  end
end
