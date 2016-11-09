require './lib/bike'

class DockingStation
  attr_accessor :bike
  attr_accessor :all_bikes


  def initialize
    @all_bikes = []
  end

  def generate_bike
    Bike.new
  end

  def release_bike
    fail if @all_bikes.empty?
    generate_bike
    @all_bikes.pop
  end

  def dock_bike(bike_name)
    fail if @all_bikes.length > 0
    @all_bikes << @bike
    @bike = bike_name
  end

  def bike_count
    @all_bikes.length
  end

end
