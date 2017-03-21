require "spec_helper"

RSpec.describe Apartment do

let(:apartment) { Apartment.new("3 Dirt Rd.", "Chilly", "ME", "02135", "2000", "1/1/17", "1/1/18", "4") }

  describe ".new" do
    it "take arguments for address, town, state and rent" do
      expect(apartment.address).to eq("3 Dirt Rd.")
      expect(apartment.town).to eq("Chilly")
      expect(apartment.state).to eq("ME")
      expect(apartment.zip).to eq("02135")
      expect(apartment.rent).to eq("2000")
      expect(apartment.lease_start_date).to eq("1/1/17")
      expect(apartment.lease_end_date).to eq("1/1/18")
    end
  end

  describe "#full?" do
    it "it has a capacity and occupants" do
      expect(apartment.capacity).to eq(4)
      expect(apartment.occupants.length).to eq(0)
    end

    it "returns true if the apartment is full" do
      occupant1 = Occupant.new("big" , "bear")
      occupant2 = Occupant.new("medium", "bear")
      occupant3 = Occupant.new("small", "bear")
      occupant4 = Occupant.new("great", "bear")
      apartment.occupants = [occupant1, occupant2, occupant3, occupant4]
      expect(apartment.full?).to be(true)
    end

    it "returns false if the apartment has space" do
      expect(apartment.full?).to be(false)
    end
  end

  describe "#add_roommate" do
    it "adds a roommate to the occupants array if there is space" do
      occupant1 = Occupant.new("big" , "bear")
      apartment.add_roommate(occupant1)
      expect(apartment.occupants.length).to be(1)
    end

    it "rasies an error if at capacity" do
      occupant1 = Occupant.new("big" , "bear")
      occupant2 = Occupant.new("medium", "bear")
      occupant3 = Occupant.new("small", "bear")
      occupant4 = Occupant.new("great", "bear")
      occupant5 = Occupant.new("mega", "bear")
      apartment.occupants = [occupant1, occupant2, occupant3, occupant4]
      expect{apartment.add_roommate(occupant5)}.to raise_error(AtCapacityError)
    end
  end

  describe "#remove_roommate" do
    it "removes a roommate whent they eat mega bears' food" do
      occupant1 = Occupant.new("big" , "bear")
      occupant2 = Occupant.new("medium", "bear")
      occupant3 = Occupant.new("small", "bear")
      occupant4 = Occupant.new("great", "bear")
      apartment.occupants = [occupant1, occupant2, occupant3, occupant4]
      apartment.remove_roommate(occupant4)
      expect(apartment.occupants.length).to be(3)
    end

    it "raises and error when trying to remove a roommate from an empty room" do
      occupant1 = Occupant.new("big" , "bear")
      expect{apartment.remove_roommate(occupant1)}.to raise_error(EmptyError)
    end

    it "raises an error when trying to remove an occupant that is not an occupant" do
      occupant1 = Occupant.new("big" , "bear")
      occupant2 = Occupant.new("medium", "bear")
      occupant3 = Occupant.new("small", "bear")
      occupant4 = Occupant.new("great", "bear")
      apartment.occupants = [occupant1, occupant2, occupant3]
      expect{apartment.remove_roommate(occupant4)}.to raise_error(NotAnOccupant)
    end
  end
end
