require "./lib/docking_station"
require "./lib/bike"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'raises an error when there are no available bikes' do
    expect { subject.release_bike }.to raise_error
  end

  it 'releases working bikes' do
    bike = subject.generate_bike
    expect(bike.working?)
  end

  it 'docks a bike' do
    is_expected.to respond_to(:dock_bike).with(1).argument
  end

  it 'docks a bike named bmx' do
    expect(subject.dock_bike('bmx')).to eq 'bmx'
  end

  it 'shows the bike name' do
    expect(subject.bike).to eq @bike
  end

  it 'checks for available bikes' do
    is_expected.to respond_to(:bike_count)
  end

  it 'raises an error when docking station is full' do
    @all_bikes = ['bmx']
    expect { subject.dock_bike }.to raise_error
  end


end
