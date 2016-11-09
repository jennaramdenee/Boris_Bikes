require './lib/bike'

class DockingStation
  attr_reader :bike

  def release_bike
    Bike.new
  end

  def dock_bike(bike_name)
    @bike = bike_name
  end

end
