class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_lengths = [side1, side2, side3]
  end
  
  class TriangleError < StandardError
  end

  def kind
   # :equilateral
    #:isosceles
    #:scalene

    if(@all_lengths.all?(&:positive?) && triangle_inequality?)
      triangle_type
    else
      raise TriangleError
    end
  end

  private

  def triangle_inequality?
    side1 + side2 > side3 && side2 + side3 > side1 && side1 + side3 > side2
  end

  def triangle_type
    if(@all_lengths.sum == @all_lengths.first * @all_lengths.count)
      :equilateral
    elsif(side1 == side2 || side1 == side3 || side2 == side3)
      :isosceles
    else
      :scalene
    end
  end

end
