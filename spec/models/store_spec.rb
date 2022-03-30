require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'instance methods' do
    describe '#sale_status' do
      it 'returns the "Sale is on" when sale evaluates to true' do
        store = Store.create!(
          name: 'test store',
          description: 'this is a test',
          address: '123 fake st.',
          rating: '5',
          sale: true
        )

        expect(store.sale_status).to eq("Sale is on")
      end

      it 'returns the "Sale is off" when sale evaluates to true' do
        store = Store.create!(
          name: 'test store',
          description: 'this is a test',
          address: '123 fake st.',
          rating: '5',
          sale: false
        )

        expect(store.sale_status).to eq("Sale is off")
      end

      it 'returns the number of products in a certain store' do
        # As a visitor
        # When I visit a parent's show page
        # I see a count of the number of children associated with this parent
        store = Store.create!(
          name: 'test store',
          description: 'this is a test',
          address: '123 fake st.',
          rating: '5',
          sale: false
        )
        prod_1 = Product.create!(
          name: 'product one',
          description: 'Test product',
          price: 100.00,
          quantity: 5,
          available_online: false,
          store_id: store.id
        )
        prod_2 = Product.create!(
          name: 'product one',
          description: 'Test product',
          price: 100.00,
          quantity: 5,
          available_online: false,
          store_id: store.id
        )

        expect(store.product_count).to eq(2)
      end

      it '#alphabetize_asc sorts products alphabetically' do
        store = Store.create!(
          name: 'test store',
          description: 'this is a test',
          address: '123 fake st.',
          rating: '5',
          sale: false
        )
        prod_1 = store.products.create!(
          name: 'Z product',
          description: 'Test product',
          price: 100.00,
          quantity: 5,
          available_online: false
        )
        prod_2 = store.products.create!(
          name: 'A product',
          description: 'Test product',
          price: 100.00,
          quantity: 5,
          available_online: false
        )

        expect(store.products).to eq([prod_1, prod_2])
        expect(store.alphabetize_asc).to eq([prod_2, prod_1])
      end
    end
  end
  describe 'class methods' do
    it '#first_to_last can sort instances by created_at' do
      store_1 = Store.create!(
        name: "Test Store",
        description: "Store to be tested",
        address: "123 test st.",
        rating: 5,
        sale: 0
      )
      sleep(0.1)
      store_5 = Store.create!(
        name: "Test Store 5",
        description: "Store 5 to be tested",
        address: "125 test st.",
        rating: 5,
        sale: 0
      )
      sleep(0.1)
      store_3 = Store.create!(
        name: "Test Store 3",
        description: "Store 3 to be tested",
        address: "124 test st.",
        rating: 5,
        sale: 0
      )
      sleep(0.1)
      store_2 = Store.create!(
        name: "Test Store 2",
        description: "Store 2 to be tested",
        address: "121 test st.",
        rating: 5,
        sale: 0
      )
      # binding.pry
      expect(Store.all).to eq([store_1, store_5, store_3, store_2])
      expect(Store.first_to_last).to eq([store_2, store_3, store_5, store_1])
    end
    
    describe '#search_by_name' do
      it 'can search by name using exact-matches' do
        store_1 = Store.create!(
          name: "Test Store",
          description: "Store to be tested",
          address: "123 test st.",
          rating: 5,
          sale: 0
        )
        store_5 = Store.create!(
          name: "Test Store 5",
          description: "Store 5 to be tested",
          address: "125 test st.",
          rating: 5,
          sale: 0
        )
        store_3 = Store.create!(
          name: "Test Store 3",
          description: "Store 3 to be tested",
          address: "124 test st.",
          rating: 5,
          sale: 0
        )
        store_2 = Store.create!(
          name: "Test Store 2",
          description: "Store 2 to be tested",
          address: "121 test st.",
          rating: 5,
          sale: 0
        )
        expect(Store.search_by_name('Test Store 5')).to eq(store_5)
      end
    end
  end
end
