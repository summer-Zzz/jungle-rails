require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe 'name' do
      it 'should return false when no name input'
        @product = Product.new({
          name:  'shirt',
          price: 78,
          quantity: 1,
          category: 'Apparel'
        })

        expect (@product.id).to be_present
    end
  end
end
