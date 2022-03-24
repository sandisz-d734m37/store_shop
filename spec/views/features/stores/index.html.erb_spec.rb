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
    # binding.pry

    expect(page).to have_content(@store_1.created_at.to_s)
    expect(page).to have_content(@store_2.created_at.to_s)
    expect(page.text).to include("Store 1\ncreated at: #{@store_1.created_at.to_s}\nStore 2\ncreated at: #{@store_2.created_at.to_s}")
    expect(page.text).not_to include("Store 2\ncreated at: #{@store_2.created_at.to_s}\nStore 1\ncreated at: #{@store_1.created_at.to_s}")
  end


end
