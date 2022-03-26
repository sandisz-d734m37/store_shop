require 'rails_helper'

# User Story 13, Parent Child Creation
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe "Store Product creation" do
  before :each do
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
  it 'has a form to create a new product for that store' do
    visit "/stores/#{@store_1.id}/products"

    click_button("Add product to #{@store_1.name}")
    expect(current_path).to eq("/stores/#{@store_1.id}/products/new")

    fill_in('Name', with: 'Test Product')
    fill_in('Description', with: 'A test product for testing')
    fill_in('Price', with: 5.03)
    fill_in('Quantity', with: 8)

    click_button("Create Product")

    expect(current_path).to eq("/stores/#{@store_1.id}/products")
    expect(page).to have_content("Test Product")
  end

end
