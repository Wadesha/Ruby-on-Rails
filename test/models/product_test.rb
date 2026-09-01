require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(
      name: "测试产品",
      category: "测试分类",
      price: 100.00,
      stock: 50,
      description: "测试描述"
    )
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?
  end

  test "price should be present" do
    @product.price = nil
    assert_not @product.valid?
  end

  test "price should be greater than 0" do
    @product.price = 0
    assert_not @product.valid?
  end

  test "stock should be present" do
    @product.stock = nil
    assert_not @product.valid?
  end

  test "stock should be non-negative" do
    @product.stock = -1
    assert_not @product.valid?
  end

  test "should have orders" do
    @product.save!
    assert_equal 0, @product.orders.count
  end
end
