require 'rails_helper'

RSpec.describe "New Store page" do
  it 'has a form to create a new store ' do
    visit "/stores/new"

    fill_in('name', with: 'Super Store')
    fill_in('description', with: 'A Super Duper Store')
    fill_in('address', with: '123 Fake st')

    click_button('submit')

    expect(current_path).to eq("/stores")
  end
end
