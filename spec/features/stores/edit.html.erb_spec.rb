require 'rails_helper'

RSpec.describe "Store edit page" do
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
  end
  it 'has a form to update store information' do
    visit "/stores/#{@store_1.id}"

    expect(page).to have_content("Store 1")
    expect(page).to have_content("Rating: 1")

    click_link("Update #{@store_1.name}")

    fill_in('Name', with: 'Store 100')
    fill_in('Rating', with: 5)

    click_button("Update")

    expect(current_path).to eq("/stores/#{@store_1.id}")
    expect(page).to have_content("Store 100")
    expect(page).to have_content("Rating: 5")
  end
end
