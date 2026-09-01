require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @customer = Customer.create!(name: "订单测试客户", phone: "13800138000", email: "order_test@example.com", address: "地址", company: "公司", notes: "")
    @product = Product.create!(name: "订单测试产品", category: "分类", price: 100.00, stock: 50, description: "描述")
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference("Order.count") do
      post orders_url, params: { order: { customer_id: @customer.id, product_id: @product.id, quantity: 1, total_price: 100.00, status: "待处理", order_date: Date.today } }
    end
    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    order = Order.create!(customer: @customer, product: @product, quantity: 1, total_price: 100.00, status: "待处理", order_date: Date.today)
    get order_url(order)
    assert_response :success
  end

  test "should get edit" do
    order = Order.create!(customer: @customer, product: @product, quantity: 1, total_price: 100.00, status: "待处理", order_date: Date.today)
    get edit_order_url(order)
    assert_response :success
  end

  test "should update order" do
    order = Order.create!(customer: @customer, product: @product, quantity: 1, total_price: 100.00, status: "待处理", order_date: Date.today)
    patch order_url(order), params: { order: { status: "已完成" } }
    assert_redirected_to order_url(order)
  end

  test "should destroy order" do
    order = Order.create!(customer: @customer, product: @product, quantity: 1, total_price: 100.00, status: "待处理", order_date: Date.today)
    assert_difference("Order.count", -1) do
      delete order_url(order)
    end
    assert_redirected_to orders_url
  end
end
