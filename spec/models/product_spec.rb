require 'rails_helper'
require 'pry'

RSpec.describe Product, type: :model do
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
      quantity: 3,
      available_online: true,
      store_id: 1
    )
    @product_2 = Product.create!(
      name: 'test product 2',
      description: 'Not a real product',
      price: 1.80,
      quantity: 4,
      available_online: false,
      store_id: 2
    )
  end

  describe 'instance methods' do
    describe '#available_online?' do

      it 'returns "Available Online" if available_online evalutes to true' do
        expect(@product_1.available_online?).to eq("Available Online")
      end

      it 'returns "Unvailable Online" if available_online evalutes to true' do
        expect(@product_2.available_online?).to eq("Unvailable Online")
      end

    end

    it 'returns the store name according to the products store_id (foreign key)' do
      expect(@product_1.store.name).to eq("first store")
      expect(@product_2.store.name).to eq("second store")
    end
  end

  describe 'class methods' do
    describe '#filter_by_quantity' do
      it 'filters products by quantity' do
        expect(Product.filter_by_quantity(4)).to eq([@product_2])
      end
    end

    describe '#search_by_name' do
      it 'can search by name using exact-matches' do
        expect(Product.search_by_name('test product')).to eq(@product_1)
      end
    end
  end

end
