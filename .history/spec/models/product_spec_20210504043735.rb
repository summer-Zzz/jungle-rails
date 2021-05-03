require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should not exist for new records" do
      @category = Category.new(name: "Apparel")
      expect(@category.id).to be_nil
    end

      # it 'is valid with valid attributes' do
      #   @category = Category.new(name: "Apparel")
      #   @product = Product.new(
      #     name:  "shirt",
      #     price: 78,
      #     quantity: 1,
      #     category: @category)
      #   expect (@product).to be_valid
      # end

      # it 'should return false when no name input'
      #   expect (@product.id).to be_nil
      # end

  end
end
