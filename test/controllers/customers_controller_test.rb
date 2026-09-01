require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference("Customer.count") do
      post customers_url, params: { customer: { name: "新客户", phone: "13800138000", email: "new_customer@example.com", address: "新地址", company: "新公司", notes: "" } }
    end
    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    customer = Customer.create!(name: "展示客户", phone: "13800138001", email: "show@example.com", address: "地址", company: "公司", notes: "")
    get customer_url(customer)
    assert_response :success
  end

  test "should get edit" do
    customer = Customer.create!(name: "编辑客户", phone: "13800138002", email: "edit@example.com", address: "地址", company: "公司", notes: "")
    get edit_customer_url(customer)
    assert_response :success
  end

  test "should update customer" do
    customer = Customer.create!(name: "更新客户", phone: "13800138003", email: "update@example.com", address: "地址", company: "公司", notes: "")
    patch customer_url(customer), params: { customer: { name: "更新后客户" } }
    assert_redirected_to customer_url(customer)
  end

  test "should destroy customer" do
    customer = Customer.create!(name: "删除客户", phone: "13800138004", email: "destroy@example.com", address: "地址", company: "公司", notes: "")
    assert_difference("Customer.count", -1) do
      delete customer_url(customer)
    end
    assert_redirected_to customers_url
  end
end
