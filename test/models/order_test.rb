require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.create!(
      name: "订单测试客户",
      phone: "13800138000",
      email: "order_test@example.com",
      address: "测试地址",
      company: "测试公司",
      notes: ""
    )
    @product = Product.create!(
      name: "订单测试产品",
      category: "测试分类",
      price: 100.00,
      stock: 50,
      description: "测试描述"
    )
    @order = Order.new(
      customer: @customer,
      product: @product,
      quantity: 2,
      total_price: 200.00,
      status: "待处理",
      order_date: Date.today
    )
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "quantity should be present" do
    @order.quantity = nil
    assert_not @order.valid?
  end

  test "quantity should be greater than 0" do
    @order.quantity = 0
    assert_not @order.valid?
  end

  test "total_price should be present" do
    @order.total_price = nil
    assert_not @order.valid?
  end

  test "status should be present" do
    @order.status = ""
    assert_not @order.valid?
  end

  test "order_date should be present" do
    @order.order_date = nil
    assert_not @order.valid?
  end

  test "should belong to customer" do
    assert_equal @customer, @order.customer
  end

  test "should belong to product" do
    assert_equal @product, @order.product
  end
end
