require 'spec_helper'

RSpec.describe Occupant do

let(:occupant) { Occupant.new("big", "bear") }

  describe ".new" do
    it "take arguments for first and last name" do
      expect(occupant.first_name).to eq("big")
      expect(occupant.last_name).to eq("bear")
    end
  end
end
