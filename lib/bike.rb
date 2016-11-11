require './lib/docking_station.rb'

class Bike
  attr_accessor :broken

  def initialize(working = true)
    @working = working
  end

  def working?
   @working
  end

  def report_as_broken
    @working = false
  end
  
end
