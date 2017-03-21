require_relative 'dwelling'

class AtCapacityError < StandardError
end

class EmptyError < StandardError
end

class NotAnOccupant < StandardError
end

class Apartment < Dwelling
  attr_reader :rent, :lease_start_date, :lease_end_date, :capacity
  attr_accessor :occupants

  def initialize(address, town, state, zip, rent, lease_start_date, lease_end_date, capacity)
    super(address, town, state, zip)
    @rent = rent
    @lease_start_date = lease_start_date
    @lease_end_date = lease_end_date
    @capacity = capacity.to_i
    @occupants = []
  end

  def full?
    @occupants.length == @capacity
  end

  def add_roommate(occupant)
    if full?
      raise AtCapacityError
    else
      @occupants << occupant
    end
  end

  def remove_roommate(occupant)
    if @occupants.empty?
      raise EmptyError
    elsif !occupants.include?(occupant)
      raise NotAnOccupant
    else
      @occupants -= [occupant]
    end
  end

end
