class Array
  def my_uniq
    counts = Hash.new(0)
    self.each { |el| counts[el] += 1 }
    counts.keys
  end

  def two_sum
    arr = []
    (0...length).each do |i|
      (i + 1...length).each do |j|
        arr << [i, j] if self[i] + self[j] == 0
      end
    end
    arr
  end
end

def my_transpose(matrix)
  width = matrix.length
  converted = Array.new(width) { Array.new }
  matrix.each do |arr|
    arr.each_with_index do |el, j|
      converted[j] << el
    end
  end
  converted
end

def stock_picker(prices)
  days = []
  profit = 0
  (0...prices.length).each do |i|
    (i + 1...prices.length).each do |j|
      if prices[j] - prices[i] > profit
        days = i, j
        profit = prices[j] - prices[i]
      end
    end
  end
  days
end

class TowerOfHanoi
  attr_reader :towers

  def initialize
    @towers = Array.new(3) { Array.new }
    @towers[0] = [3, 2, 1]
  end

  def get_input
    input = gets.chomp
    move(input)
  end

  def move(from, to)
    if valid_move?(from, to)
      disc = @towers[from].pop
      @towers[to] << disc
    end
  end

  def valid_move?(from, to)
    disc = @towers[from].last
    destination = @towers[to].last
    if !disc.nil? && (destination.nil? || disc < destination)
      return true
    end
    raise StandardError "Invalid move"
  end

  def won?
    @towers[1].length == 3 || @towers[2].length == 3
  end
end
