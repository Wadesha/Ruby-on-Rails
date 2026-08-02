# 清空现有数据
Order.delete_all
Customer.delete_all
Product.delete_all

puts "创建客户数据..."

customers = Customer.create!([
  {
    name: "张三",
    phone: "13800138001",
    email: "zhangsan@example.com",
    address: "北京市朝阳区建国路88号",
    company: "北京科技有限公司",
    notes: "VIP客户，需要定期回访"
  },
  {
    name: "李四",
    phone: "13900139002",
    email: "lisi@example.com",
    address: "上海市浦东新区陆家嘴金融区100号",
    company: "上海贸易有限公司",
    notes: "重要合作伙伴"
  },
  {
    name: "王五",
    phone: "13700137003",
    email: "wangwu@example.com",
    address: "广州市天河区珠江新城50号",
    company: "广州信息科技有限公司",
    notes: ""
  },
  {
    name: "赵六",
    phone: "13600136004",
    email: "zhaoliu@example.com",
    address: "深圳市南山区科技园南区20号",
    company: "深圳创新科技有限公司",
    notes: "新客户，需要跟进"
  },
  {
    name: "陈七",
    phone: "13500135005",
    email: "chenqi@example.com",
    address: "杭州市西湖区文三路100号",
    company: "杭州电子商务有限公司",
    notes: "长期合作客户"
  },
  {
    name: "刘八",
    phone: "13400134006",
    email: "liuba@example.com",
    address: "成都市高新区天府大道200号",
    company: "成都软件开发有限公司",
    notes: ""
  },
  {
    name: "孙九",
    phone: "13300133007",
    email: "sunjiu@example.com",
    address: "武汉市洪山区光谷大道300号",
    company: "武汉光谷科技有限公司",
    notes: "大客户，优先处理"
  },
  {
    name: "周十",
    phone: "13200132008",
    email: "zhoushi@example.com",
    address: "南京市鼓楼区新模范马路150号",
    company: "南京教育科技有限公司",
    notes: ""
  }
])

puts "创建产品数据..."

products = Product.create!([
  {
    name: "智能办公椅 Pro",
    category: "办公家具",
    price: 2999.00,
    stock: 50,
    description: "人体工学设计，支持多角度调节，透气网布面料"
  },
  {
    name: "27寸4K显示器",
    category: "电子设备",
    price: 3999.00,
    stock: 30,
    description: "IPS面板，Type-C接口，支持HDR400"
  },
  {
    name: "机械键盘 K8",
    category: "电脑外设",
    price: 599.00,
    stock: 100,
    description: "Cherry MX轴体，蓝牙双模，RGB背光"
  },
  {
    name: "无线鼠标 Master 3",
    category: "电脑外设",
    price: 899.00,
    stock: 80,
    description: "人体工学设计，4000DPI，USB-C充电"
  },
  {
    name: "笔记本支架",
    category: "办公配件",
    price: 299.00,
    stock: 200,
    description: "铝合金材质，可调节高度，便携折叠"
  },
  {
    name: "降噪耳机 Pro",
    category: "音频设备",
    price: 1999.00,
    stock: 40,
    description: "主动降噪，40小时续航，Hi-Res认证"
  },
  {
    name: "USB-C扩展坞",
    category: "电脑配件",
    price: 499.00,
    stock: 150,
    description: "10合1扩展坞，支持PD100W充电，4K输出"
  },
  {
    name: "桌面台灯 Pro",
    category: "办公照明",
    price: 399.00,
    stock: 120,
    description: "无频闪，色温可调，智能感应"
  }
])

puts "创建订单数据..."

statuses = ["待处理", "处理中", "已发货", "已完成", "已取消"]

orders_data = [
  { customer: customers[0], product: products[0], quantity: 2, status: "已完成", order_date: Date.new(2026, 7, 15) },
  { customer: customers[0], product: products[2], quantity: 1, status: "已完成", order_date: Date.new(2026, 7, 15) },
  { customer: customers[1], product: products[1], quantity: 3, status: "已发货", order_date: Date.new(2026, 7, 20) },
  { customer: customers[1], product: products[3], quantity: 2, status: "已发货", order_date: Date.new(2026, 7, 20) },
  { customer: customers[2], product: products[4], quantity: 10, status: "处理中", order_date: Date.new(2026, 7, 25) },
  { customer: customers[2], product: products[6], quantity: 5, status: "处理中", order_date: Date.new(2026, 7, 25) },
  { customer: customers[3], product: products[5], quantity: 1, status: "待处理", order_date: Date.new(2026, 7, 28) },
  { customer: customers[4], product: products[0], quantity: 4, status: "已完成", order_date: Date.new(2026, 7, 10) },
  { customer: customers[4], product: products[2], quantity: 8, status: "已完成", order_date: Date.new(2026, 7, 10) },
  { customer: customers[5], product: products[7], quantity: 3, status: "已发货", order_date: Date.new(2026, 7, 22) },
  { customer: customers[5], product: products[4], quantity: 6, status: "已发货", order_date: Date.new(2026, 7, 22) },
  { customer: customers[6], product: products[1], quantity: 2, status: "待处理", order_date: Date.new(2026, 7, 30) },
  { customer: customers[6], product: products[6], quantity: 3, status: "待处理", order_date: Date.new(2026, 7, 30) },
  { customer: customers[7], product: products[3], quantity: 1, status: "处理中", order_date: Date.new(2026, 7, 18) },
  { customer: customers[7], product: products[5], quantity: 2, status: "处理中", order_date: Date.new(2026, 7, 18) },
  { customer: customers[0], product: products[7], quantity: 1, status: "已完成", order_date: Date.new(2026, 6, 28) },
  { customer: customers[2], product: products[1], quantity: 1, status: "已完成", order_date: Date.new(2026, 6, 25) },
  { customer: customers[3], product: products[0], quantity: 1, status: "已取消", order_date: Date.new(2026, 7, 5) },
  { customer: customers[5], product: products[2], quantity: 3, status: "已完成", order_date: Date.new(2026, 7, 8) },
  { customer: customers[1], product: products[4], quantity: 2, status: "已完成", order_date: Date.new(2026, 7, 12) },
]

orders_data.each do |data|
  Order.create!(
    customer: data[:customer],
    product: data[:product],
    quantity: data[:quantity],
    total_price: (data[:product].price * data[:quantity]).round(2),
    status: data[:status],
    order_date: data[:order_date]
  )
end

puts "种子数据创建完成！"
puts "  客户: #{Customer.count} 条"
puts "  产品: #{Product.count} 条"
puts "  订单: #{Order.count} 条"