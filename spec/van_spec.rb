require './lib/docking_station'
require './lib/bike'
require 'van'

describe Van do

  let(:docking_station) { double :docking_station }
  let(:bike_broken) { double :bike }
  let(:bike_working) { double :bike }

  it 'collects broken bikes from the docking station' do
    allow(bike_broken).to receive(:working?).and_return(false)
    allow(docking_station).to receive(:broken_bike).and_return([bike_broken])
    subject.collect_broken_bikes(docking_station)
    expect(subject.all_bikes).to eq [bike_broken]
  end




end
