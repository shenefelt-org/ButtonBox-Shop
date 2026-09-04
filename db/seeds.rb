puts "Clearing existing data..."
[ OrderItem, LineItem, Order, Quote, Subscription, Product, Customer ].each(&:destroy_all)

puts "Creating Customers..."

customer1 = Customer.create!(
  name: "Jane Doe",
  email: "jane@buttonbox.cc"
)

puts "Creating Products..."
product1 = Product.create!(
  title: "Pro Subscription Plan",
  description: "Full access to ButtonBox features",
  price_in_cents: 4999,
  stripe_product_id: "prod_12345",
  stripe_price_id: "price_12345",
  active: true
)

product2 = Product.create!(
  title: "Add-on Module",
  description: "Extra analytics tools",
  price_in_cents: 1500,
  stripe_product_id: "prod_67890",
  stripe_price_id: "price_67890",
  active: true
)

puts "Creating Quotes & Line Items..."
quote = Quote.create!(
  quote_number: 1001,
  approved: true,
  total_amount: 6499,
  customer_id: customer1.id
)

LineItem.create!(
  quote: quote,
  product: product1,
  quantity: 1,
  unit_price: 49.99
)

LineItem.create!(
  quote: quote,
  product: product2,
  quantity: 1,
  unit_price: 15.00
)

puts "Creating Subscriptions..."
Subscription.create!(
  product: product1,
  active: "true",
  billing_cycle_type: "monthly",
  user_id: User.first.id
)

puts "Seeds executed successfully!"
