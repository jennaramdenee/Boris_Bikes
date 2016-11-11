require './lib/van'
require './lib/bike'
require './lib/garage'

describe Garage do

  let(:van) { double :van }
  let(:bike) { double :bike }

  it 'should initialize with an empty array to hold bikes' do
    expect(subject.all_bikes).to eq []
  end

  it 'should take broken bikes from vans' do
    allow(bike).to receive(:working?).and_return(false)
    allow(van).to receive(:all_bikes).and_return([bike])
    expect(subject.garage_take_bikes(van)).to eq ([bike])
  end

  it 'should leave an empty van once broken bikes have been taken to garage' do
    allow(van).to receive(:all_bikes).and_return([bike])
    subject.garage_take_bikes(van)
    expect(van.all_bikes).to eq []
  end


end
