require 'rails_helper'

RSpec.describe "stores/index", type: :feature do
  before(:each) do
      @store_1 = Store.create!(
        name: "Store 1",
        description: "The store one",
        address: "123 fake st.",
        rating: 1,
        sale: false
      )
      sleep(1)
      @store_2 = Store.create!(
        name: "Store 2",
        description: "The store two",
        address: "123 real st.",
        rating: 5,
        sale: false
      )

  end

  it "displays all store names" do
      visit "/stores"

      expect(page).to have_content(@store_1.name)
      expect(page).to have_content(@store_2.name)
  end

  it "is ordered by created_at and displays created_at" do
    visit "/stores"

    expect(page).to have_content(@store_1.created_at.to_s)
    expect(page).to have_content(@store_2.created_at.to_s)
    expect(@store_2.name).to appear_before(@store_1.name)
  end

  it 'displays a link to the product index' do
    visit "/stores"

    expect(page).to have_link(href: "/products")
  end

  it 'has a link to the create a new store' do
    visit "/stores"

    click_link "New Store"

    expect(current_path).to eq("/stores/new")
  end

  it 'has links to update each stores info' do
    visit "/stores"

    expect(page).to have_button("Update #{@store_1.name}")
    expect(page).to have_button("Update #{@store_2.name}")

    click_button("Update #{@store_2.name}")

    expect(current_path).to eq("/stores/#{@store_2.id}/edit")
  end

  it 'has buttons to delete individual stores' do
    store_3 = Store.create!(
      name: "Sucky Store",
      description: "This store is bad and on the way out",
      address: "Noone even cares",
      rating: 1,
      sale: true
    )

    product_4 = store_3.products.create!(
      name: 'product four',
      description: 'The only product at Sucky Store',
      price: 13000.00,
      quantity: 19,
      available_online: false,
    )

    visit "/stores"
    click_button("Delete Sucky Store")

    expect(current_path).to eq("/stores")
    expect(page).not_to have_content(store_3.name)
    expect(page).to have_content(@store_2.name)

    click_link("All Products")
    expect(page).not_to have_content(product_4.name)
  end

  scenario 'when I type a keyword into the search field, I only see stores with exact matching names' do
    visit "/stores"

    expect(page).to have_content(@store_1.name)
    expect(page).to have_content(@store_2.name)

    expect(page).to have_field('Search by name')
    fill_in('Search by name', with: @store_2.name)
    click_button('Search')

    expect(current_path).to eq("/stores")
    expect(page).to have_content(@store_2.name)
    expect(page).not_to have_content(@store_1.name)
  end

  scenario 'when I type a keyword into the search field, I only see stores with exact matching names' do
    visit "/stores"

    expect(page).to have_content(@store_1.name)
    expect(page).to have_content(@store_2.name)

    expect(page).to have_field('Search by name')
    fill_in('Search by name', with: @store_2.name)
    click_button('Search')

    expect(current_path).to eq("/stores")
    expect(page).to have_content(@store_2.name)
    expect(page).not_to have_content(@store_1.name)
  end
end
