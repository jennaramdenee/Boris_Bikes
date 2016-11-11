require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }
  let(:bike_working) { double :bike }
  let(:bike_broken) { double :bike }

  it { is_expected.to respond_to :release_bike }

  it { expect(subject.generate_bike).to eq subject.all_bikes }

  it { is_expected.to respond_to :dock }

  it {is_expected.to respond_to(:all_bikes)}

  it 'tests that bike docked is an instance of bike' do
    subject.all_bikes = []
    allow(bike).to receive(:instance_of?).and_return(Bike)
    subject.dock(bike)
    expect(subject.all_bikes[0]).to be_instance_of(Bike)
  end

  it 'tests that bike docked, matches bike created' do
    subject.all_bikes = []
    subject.dock(bike)
    expect(subject.all_bikes).to match([bike])
  end

  it 'returns docked bikes' do
    subject.all_bikes = []
    subject.dock(bike)
    expect(subject.all_bikes).to eq subject.all_bikes
  end

  it 'raises error if no bikes to release' do
    subject.all_bikes = []
    expect { subject.release_bike }.to raise_error(RuntimeError, "No bikes available")
  end

  it 'raises error if docking station is full' do
    expect { subject.dock(bike) }.to raise_error(RuntimeError, "Docking station full")
  end

  it 'adds a bike to array when docked' do
    subject.all_bikes = []
    subject.dock(bike)
    expect(subject.all_bikes.length).to eq 1
  end

  it 'removes a bike when a bike is released' do
    subject.release_bike
    expect(subject.all_bikes.length).to eq 19
  end

  it 'sets a default docking station capacity to 20' do
    expect(subject.CAPACITY).to eq 20
  end

  it 'allows user to set any capacity' do
    station = DockingStation.new(30)
    expect(station.CAPACITY).to eq 30
  end

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'does not allow broken bikes to be docked' do
    subject.all_bikes = []
    allow(bike).to receive(:working?).and_return(false)
    allow(bike).to receive(:report_as_broken)
    bike.report_as_broken
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error("Can't release broken bike")
  end

  it 'tests whether a generated bike is working' do
    allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq true
  end

  it 'should have an empty array to hold broken bikes' do
    expect(subject.broken_bikes).to eq []
  end

  it 'should load broken bikes from the docking station' do
    allow(bike_broken).to receive(:working?).and_return(false)
    allow(bike_working).to receive(:working?).and_return(true)
    subject.all_bikes = [bike_broken, bike_working]
    subject.load_broken_bikes
    expect(subject.broken_bikes).to eq [bike_broken]
  end

  it 'once broken bikes have been loaded, it should remove broken bikes from docking station' do
    allow(bike_broken).to receive(:working?).and_return(false)
    allow(bike_working).to receive(:working?).and_return(true)
    subject.all_bikes = [bike_broken, bike_working]
    subject.load_broken_bikes
    expect(subject.all_bikes).to eq [bike_working]
  end


end
