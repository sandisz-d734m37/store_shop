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
          on_sale: false,
          store_id: store.id
        )
        prod_2 = Product.create!(
          name: 'product one',
          description: 'Test product',
          price: 100.00,
          quantity: 5,
          on_sale: false,
          store_id: store.id
        )

        expect(store.product_count).to eq(2)
      end
    end
  end
end
