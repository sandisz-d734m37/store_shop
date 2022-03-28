require 'rails_helper'

RSpec.describe "New Store page" do
  it 'has a form to create a new store ' do
    visit "/stores/new"

    fill_in('Name', with: 'Super Store')
    fill_in('Description', with: 'A Super Duper Store')
    fill_in('Address', with: '123 Fake st')

    click_button('Create Store')

    expect(current_path).to eq("/stores")
    expect(page).to have_content("Super Store")
  end

  it 'has a checkbox to decide if there is a sale on' do
    visit "/stores/new"

    expect(page).to have_field('sale', checked: false)
  end
end
