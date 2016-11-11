require './lib/van.rb'

class Garage

attr_reader :all_bikes

  def initialize
    @all_bikes = []
  end

  def garage_take_bikes(location)
    location.all_bikes.each { |bike|
      @all_bikes << bike
      location.all_bikes.delete(bike)
    }
    return @all_bikes
  end

end
