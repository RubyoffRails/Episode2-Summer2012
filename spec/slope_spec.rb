require_relative '../lib/slope.rb'

describe Slope do
  it "should calculate the slope of line" do
    values = { x1: 2015, x2: 1990,
               y1: 50, y2: 44 }
    Slope.calculate(values).should eq(0.24)
  end
end