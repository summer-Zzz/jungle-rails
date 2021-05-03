require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe 'name' do
      it 'should return false when no name input'
        @product = Product.new({
          name:  'Men\'s Classy shirt',
          description: Faker::Hipster.paragraph(4),
          image: 'apparel1.jpg',
          quantity: 0,
          price: 64.99
        })
        @product.save!
        expect (@product.id).to be_nil
    end
  end
end
