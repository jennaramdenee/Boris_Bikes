require "./lib/docking_station"
require "./lib/bike"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'releases working bikes' do
    bike = subject.release_bike
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



end
