class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item] == nil
      return 0
    else
      @inventory[item]
    end
  end

  def stock(item,amount)
    if @inventory[item] == nil
      @inventory[item] = amount
    else
      @inventory[item] = (@inventory[item] += amount)
    end
  end

  def potential_revenue
    @inventory.sum {|item,amount| item.price * amount}
  end

end
