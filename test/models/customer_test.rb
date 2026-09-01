require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.new(
      name: "测试客户",
      phone: "13800138000",
      email: "test@example.com",
      address: "测试地址",
      company: "测试公司",
      notes: "测试备注"
    )
  end

  test "should be valid" do
    assert @customer.valid?
  end

  test "name should be present" do
    @customer.name = ""
    assert_not @customer.valid?
  end

  test "phone should be present" do
    @customer.phone = ""
    assert_not @customer.valid?
  end

  test "email should be present" do
    @customer.email = ""
    assert_not @customer.valid?
  end

  test "email should be unique" do
    duplicate = @customer.dup
    @customer.save!
    assert_not duplicate.valid?
  end

  test "should have orders" do
    @customer.save!
    assert_equal 0, @customer.orders.count
  end
end
