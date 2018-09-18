require 'rails_helper'
require 'capybara/rails'

RSpec.describe Product, type: :model do
  describe "Validations" do
    a_product = Product.new(name: "dress", price_cents: 10000, quantity: 10)
    @category = Category.new(name: "clothes")
    a_product.category = @category

    it 'should be valid if all fields are valid' do
      expect(a_product).to be_valid
    end

    it 'should not be valid name is not valid' do
      a_product.name = nil
      expect(a_product).to_not be_valid

    end

    it 'should not be valid price is not valid' do
      a_product.price = nil
      expect(a_product).to_not be_valid
    end

    it 'should not be valid quantity is not valid' do
      a_product.quantity = nil
      expect(a_product).to_not be_valid
    end

    it 'should not be valid category is not valid' do
      a_product.category = nil
      expect(a_product).to_not be_valid
    end

  end
end