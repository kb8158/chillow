class Dwelling
  attr_reader :address, :town, :state, :zip
  def initialize(address, town, state, zip)
    @address = address
    @town = town
    @state = state
    @zip = zip
  end
end
