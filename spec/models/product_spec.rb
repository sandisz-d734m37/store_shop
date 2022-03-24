require 'rails_helper'
require 'pry'

RSpec.describe Product, type: :model do
  describe 'instance methods' do
    describe '#sale_status' do

      before(:each) do
        @store = Store.create!(
          id: 1,
          name: 'first store',
          description: 'this is a test',
          address: '123 fake st.',
          rating: '5',
          sale: true
        )
        @store_2 = Store.create!(
          id: 2,
          name: 'second store',
          description: 'this is a test',
          address: '123 fake st.',
          rating: '5',
          sale: true
        )

        @product_1 = Product.create!(
          name: 'test product',
          description: 'Not a real product',
          price: 1.55,
          quantity: 4,
          on_sale: true,
          store_id: 1
        )
        @product_2 = Product.create!(
          name: 'test product 2',
          description: 'Not a real product',
          price: 1.80,
          quantity: 4,
          on_sale: false,
          store_id: 2
        )
      end

      it 'returns "Sale is on" if sale evalutes to true' do
        expect(@product_1.sale_status).to eq("Sale is on")
      end

      it 'returns "Sale is off" if sale evalutes to true' do
        expect(@product_2.sale_status).to eq("Sale is off")
      end

      it 'returns the store name according to the products store_id (foreign key)' do
        expect(@product_1.store.name).to eq("first store")
        expect(@product_2.store.name).to eq("second store")
      end
    end
  end
end
