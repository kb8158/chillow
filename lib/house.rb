class House < Dwelling

  attr_reader :ask_price

  def initialize(address, town, state, zip, ask_price)
    super(address, town, state, zip)
    @ask_price = ask_price
  end
  
end
