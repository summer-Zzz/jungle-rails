require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

      it 'is valid with valid attributes' do
        @category = Category.new(name: "Apparel")
        @product = Product.new(
          name:  "shirt",
          price: 78,
          quantity: 1,
          category: @category)
        expect(@product).to be_valid
      end

      it 'should return nil when no name input' do
        @category = Category.new(name: "Apparel")
        @product = Product.new(
          name:  nil,
          price: 78,
          quantity: 1,
          category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to_not include "Name can't be blank"
      end

      # it 'should return nil when no name input' do
      #   @category = Category.new(name: "Apparel")
      #   @product = Product.new(
      #     name:  nil,
      #     price: 78,
      #     quantity: 1,
      #     category: @category)
      #   expect(@product.id).to be_nil
      # end
  end
end
