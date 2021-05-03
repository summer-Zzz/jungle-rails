require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe 'name' do
      it 'should return false when no name input'
        @product = Product.new({
          name:  'Men\'s Classy shirt',
          price: 64.99,
          quantity: 0,
          category: Apparel
        })
        @product.save!
        expect (@product.id).to be_present
    end
  end
end
