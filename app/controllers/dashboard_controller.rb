class DashboardController < ApplicationController
  def index
    @customer_count = Customer.count
    @product_count = Product.count
    @order_count = Order.count
    @recent_orders = Order.includes(:customer, :product).order(created_at: :desc).limit(5)
    @total_revenue = Order.sum(:total_price)
  end
end
