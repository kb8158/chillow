require 'spec_helper'

RSpec.describe House do

let(:house) { House.new("3 Dirt Rd.", "Chilly", "ME", "02135", "200000") }

  describe ".new" do
    it "take arguments for address, town, state and zip_code" do
      expect(house.address).to eq("3 Dirt Rd.")
      expect(house.town).to eq("Chilly")
      expect(house.state).to eq("ME")
      expect(house.zip).to eq("02135")
      expect(house.ask_price).to eq("200000")
    end
  end
end
