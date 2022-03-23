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
  end

  it 'can list store attributes' do
    visit "stores/#{@store_1.id}"

    expect(page).to have_content(@store_1.name)
    expect(page).to have_content(@store_1.description)
    expect(page).to have_content(@store_1.address)
    expect(page).to have_content(@store_1.rating)
    expect(page).to have_content(@store_1.sale_status)
  end
end
