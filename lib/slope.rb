class Slope
  def self.calculate( values={} )
    (( values[:y1] - values[:y2] ) / ( values[:x1] - values[:x2] ).to_f).round(3)
  end
end