class Event
require 'pry'

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select {|truck| truck.inventory.key?(item)}
  end

  def all_items_on_sale
    all_items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |inventory_item|
        all_items << inventory_item[0]
      end
    end
    all_items
  end

  def sorted_item_list
    return_array = []
    all_items_on_sale.each do |item|
      return_array << item.name
    end
    return_array.uniq.sort
  end

  def sold_by_more_than_one_truck?(item)
    all_inventory = []
    @food_trucks.each do |truck|
      truck.inventory.each do |inventory_item|
        all_inventory << inventory_item[0]
      end
    end
    all_inventory.count(item) > 1
  end

  def total_inventory_by_item(item)
    @food_trucks.sum {|truck| truck.check_stock(item)}
  end

  def overstocked_items
    return_array = []
    all_items_on_sale.uniq.each do |item|
      if (sold_by_more_than_one_truck?(item) && (total_inventory_by_item(item) > 50))
        return_array << item
      end
    end
    return_array
  end

end
