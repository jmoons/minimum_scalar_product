class MSP_OnePass
  def initialize(vector1, vector2)
    @vector1      = vector1
    @vector2      = vector2
    @smallest_sum = nil
  end

  def run
    vector1_sorted          = @vector1.sort
    vector2_sorted_reversed = @vector2.sort.reverse
    calculate_sum_product(vector1_sorted, vector2_sorted_reversed)
    puts "DONE (ONE PASS): #{@smallest_sum}"
  end

  private
  def calculate_sum_product(vector1, vector2)
    sum = 0
    (0 ... vector1.length).each do |current_index|
      sum += (vector1[current_index] * vector2[current_index])
    end
    @smallest_sum = sum
  end
end

class MinimumScalarProduct
  def initialize(vector1, vector2)
    @vector1      = vector1
    @vector2      = vector2
    @smallest_sum = nil
    @largest_sum  = nil
  end
  def run
    @vector1.permutation.each do |vector1_permutation|
      test_permutation(vector1_permutation)
    end
    puts "DONE (Small): #{@smallest_sum.inspect}"
    puts "DONE (Large): #{@largest_sum.inspect}"
  end

  private

  def test_permutation(vector1_permutation)
    sum = 0
    (0 ... vector1_permutation.length).each do |current_index|
      sum += (vector1_permutation[current_index] * @vector2[current_index])
    end
    test_for_smallest_sum(sum)
    test_for_largest_sum(sum)
  end

  def test_for_smallest_sum(sum)
    @smallest_sum = sum unless @smallest_sum
    @smallest_sum = sum if sum < @smallest_sum
  end

  def test_for_largest_sum(sum)
    @largest_sum = sum unless @largest_sum
    @largest_sum = sum if sum > @largest_sum
  end
end

MSP_OnePass.new([1,3,-5], [-2,4,1]).run
MinimumScalarProduct.new([1,3,-5], [-2,4,1]).run

MSP_OnePass.new([1, 2, 3, 4, 5], [1, 0, 1, 0, 1]).run
MinimumScalarProduct.new([1, 2, 3, 4, 5], [1, 0, 1, 0, 1]).run

MSP_OnePass.new([0, -6, 3], [4, 1, 8]).run
MinimumScalarProduct.new([0, -6, 3], [4, 1, 8]).run



# MinimumScalarProduct.new([1,3,-5], [-2,4,1]).run
# MinimumScalarProduct.new([1, 2, 3, 4, 5], [1, 0, 1, 0, 1]).run