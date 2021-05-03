require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe 'name' do
      it 'should return false when no name input'
        @product = Product.new('some description', 'apparel6.jpg', 82, 224.50)
        @product.save!
        expect (@product.id).to be_nil
    end
  end
end
