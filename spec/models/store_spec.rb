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
    end
  end
end
