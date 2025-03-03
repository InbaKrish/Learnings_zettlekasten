---
tags:
  - SystemDesign/Databases
Reference:
  - https://medium.com/@sean0628/a-deep-dive-into-postgresql-isolation-levels-insights-for-rails-developers-3c2de0a2ab69 
  - https://medium.com/@golang.learner.amazing/mastering-postgresql-an-engineers-guide-to-isolation-levels-8b8b2ad65b3f
---
## Dirty Read

One transaction's query reads uncommitted data altered from other transactions.

## Non-Repeatable Read



```ruby
product_id = 1

# T1
Product.transaction do
  initial_price = Product.find(product_id).price
  puts "Transaction 1: Initial read price is #{initial_price}"

  # T2
  Thread.new do
    Product.transaction do
      product = Product.find(product_id)
      product.update(price: initial_price + 100)
      puts "Transaction 2: Updated price to #{product.price}"
    end
  end.join

  sleep(3)

  # T1
  final_price = Product.find(product_id).price
  puts "Transaction 1: Re-read price is #{final_price}"
end

#=> Transaction 1: Initial read price is 200
#=> Transaction 2: Updated price to 300
#=> Transaction 1: Re-read price is 300
```