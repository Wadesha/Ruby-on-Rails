require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { name: "新产品", category: "分类", price: 100.00, stock: 50, description: "描述" } }
    end
    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    product = Product.create!(name: "展示产品", category: "分类", price: 100.00, stock: 50, description: "描述")
    get product_url(product)
    assert_response :success
  end

  test "should get edit" do
    product = Product.create!(name: "编辑产品", category: "分类", price: 100.00, stock: 50, description: "描述")
    get edit_product_url(product)
    assert_response :success
  end

  test "should update product" do
    product = Product.create!(name: "更新产品", category: "分类", price: 100.00, stock: 50, description: "描述")
    patch product_url(product), params: { product: { name: "更新后产品" } }
    assert_redirected_to product_url(product)
  end

  test "should destroy product" do
    product = Product.create!(name: "删除产品", category: "分类", price: 100.00, stock: 50, description: "描述")
    assert_difference("Product.count", -1) do
      delete product_url(product)
    end
    assert_redirected_to products_url
  end
end
