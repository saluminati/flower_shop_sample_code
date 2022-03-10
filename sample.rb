
require 'rubygems'
require 'bundler/setup'
require 'flower_shop'


# Load the inventory from array 
FlowerShop.configure  do |config|
	config.inventory_type = 'array'
	config.inventory_meta_deta = [
			'Rose Anita A80 5@40',
			'Rose Anita A80 10@60',
			'Rose Anita A50 20@60',
			]
end

order_items = FlowerShop.place_order(quantity: 10, product_code: 'A80')
puts "Ordered 10 flowers from A80, bundled: #{order_items.inspect} containing #{order_items.sum} flowers"

# Load Inventory from file
file_path = File.expand_path('valid_inventory_items.txt')

FlowerShop.configure  do |config|
	config.inventory_type = 'file'
	config.inventory_meta_deta = file_path
end

order_items = FlowerShop.place_order(quantity: 15, product_code: 'B22')
puts "Ordered 15 flowers from B22, bundled: #{order_items.inspect} containing #{order_items.sum} flowers"


# Load closest possible bundles
order_items = FlowerShop.place_order(quantity: 17, product_code: 'B22')
puts "Ordered 17 flowers from B22, bundled: #{order_items.inspect} containing #{order_items.sum} flowers"