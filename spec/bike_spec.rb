require "./lib/bike"

describe Bike do
  it { is_expected.to respond_to(:working?) }
  #expect the bike to be working

end
