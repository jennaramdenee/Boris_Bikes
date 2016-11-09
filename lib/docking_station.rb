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
    if @all_bikes.empty? fail
    else generate_bike
      @all_bikes.pop
    end
  end

  def dock_bike(bike_name)
    @all_bikes << @bike
      @bike = bike_name
  end

  def bike_count
    @all_bikes.length
  end

end
