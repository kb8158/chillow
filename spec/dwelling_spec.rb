require 'spec_helper'

RSpec.describe Dwelling do

let(:dwelling) { Dwelling.new("3 Dirt Rd.", "Chilly", "ME", "02135") }

  describe ".new" do
    it "take arguments for address, town, state and zip_code" do
      expect(dwelling.address).to eq("3 Dirt Rd.")
      expect(dwelling.town).to eq("Chilly")
      expect(dwelling.state).to eq("ME")
      expect(dwelling.zip).to eq("02135")
    end
  end
end
