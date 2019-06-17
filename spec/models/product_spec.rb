require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'product with all validatations passed' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new
      @product.category = cat1
      @product.name = "new product"
      @product.quantity = 1
      @product.price = 1
      expect(@product.category).to be_present
      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present
    end

    it 'product should have a name' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new
      @product.price = 1
      @product.quantity = 1
      @product.category = cat1
      expect(@product.name).to be_present
    end

    it 'product should have a price' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new
      @product.name = "new product"
      @product.quantity = 1
      @product.category = cat1
      expect(@product.price).to be_present
    end

    it 'product should have a quantity' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new
      @product.price = 1
      @product.name = "new product"
      @product.category = cat1
      expect(@product.quantity).to be_present
    end

    it 'product should have a category' do
      @product = Product.new
      @product.name = "new product"
      @product.quantity = 1
      @product.price = 1
      expect(@product.category).to be_present
    end

  end
end