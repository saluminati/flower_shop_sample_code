
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

cart = FlowerShop.place_order(quantity: 10, product_code: 'A80')
cart.print_order

puts "=========================="

# Load Inventory from file
file_path = File.expand_path('valid_inventory_items.txt')

FlowerShop.configure  do |config|
	config.inventory_type = 'file'
	config.inventory_meta_deta = file_path
end

cart = FlowerShop.place_order(quantity: 15, product_code: 'B22')
cart.print_order

puts "=========================="


# Load closest possible bundles
cart = FlowerShop.place_order(quantity: 17, product_code: 'B22')
cart.print_order

puts "=========================="