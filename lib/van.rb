require './lib/docking_station.rb'
class Van

attr_reader :all_bikes

  def initialize
    @all_bikes = []
  end

  def collect_broken_bikes(location)
    @all_bikes = location.broken_bikes
  end



end
