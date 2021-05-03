require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

      it 'is valid with valid attributes' do
        @product = Product.new(
          name:  "shirt",
          price: 78,
          quantity: 1,
          category: 'Apparel')
        expect (@product).to be_valid
      end

      # it 'should return false when no name input'
      #   expect (@product.id).to be_nil
      # end

  end
end