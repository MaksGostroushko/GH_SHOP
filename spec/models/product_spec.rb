require 'rails_helper'

RSpec.describe Product, type: :model do

  it "product's valid" do
    product = Product.create(title:"title", result:"4-3-2", price: "1", description: "1234567890")
    expect(product.valid?).to be true
  end

  it "product's title should be present" do
    product = Product.create(title:"", result:"4-3-2", price: "1", description: "1234567890")
    expect(product.valid?).to be false
  end

  it "product's title should be longer than 3 symbols" do
      product = Product.create(title:"t", result:"", price: "1", description: "1234567890")
      expect(product.valid?).to be false
  end

  it "product result should be present" do
    product = Product.create(title:"title", result:"", price: "1", description: "1234567890")
    expect(product.valid?).to be false
  end

  it "description should be present" do
      product = Product.create(title:"title", result:"1-1-1", price: "1", description: "")
      expect(product.valid?).to be false
  end

  it "description should be longer than 10 symbols" do
      product = Product.create(title:"title", result:"1-1-1", price: "1", description: "12345")
      expect(product.valid?).to be false
  end

  it "description should be shorter than 500 symbols" do
      product = Product.create(title:"title", result:"1-1-1", price: "1", description: "a" * 501)
      expect(product.valid?).to be false
  end
end
