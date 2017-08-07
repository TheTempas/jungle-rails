require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(name: "Test Products Category")
    end

    it "Should not save if there is no name" do
      @product = Product.new(
        price: 5,
        quantity: 10,
        category: @category
        )
      expect(@product.valid?).to be(false)
    end

    it "Should not save if there is no price" do
      @product = Product.new(
        name: "Test Product",
        quantity: 10,
        category: @category
        )
      expect(@product.valid?).to be(false)
    end

    it "Should not save if there is no quantity" do
      @product = Product.new(
        name: "Test Product",
        price: 5,
        category: @category
        )
      expect(@product.valid?).to be(false)
    end

    it "Should not save if there is no category" do
      @product = Product.new(
        name: "Test Product",
        price: 5,
        quantity: 10
        )
      expect(@product.valid?).to be(false)
    end

    it "Should save correctly when all fields are present" do
      @product = Product.new(
        name: "Test Product",
        price: 5,
        quantity: 10,
        category: @category
        )
      expect(@product.valid?).to be(true)
    end

  end
end
