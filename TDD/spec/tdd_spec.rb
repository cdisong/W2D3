require "rspec"
require "tdd"

describe Array do
  describe "#my_uniq" do
    subject(:arr) { [4, 7, 5, 5, 4, 2, 5, 1] }

    it "does not return the original array" do
      original = arr.dup
      uniqued = arr.my_uniq
      expect(arr).to eq(original)
      expect(uniqued).to_not eq(original)
    end

    it "removes duplicates" do
      expect(arr.my_uniq).to eq([4, 7, 5, 2, 1])
    end
  end

  describe "#two_sum" do
    subject(:arr) { [-1, 0, 2, -2, 1] }

    it "returns the pairs in dictionary order" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  context "when argument is an array of rows" do
    subject(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    let(:cols) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] }

    it "returns an array of columns" do
      expect(my_transpose(rows)).to eq(cols)
    end
  end

  context "when argument is an array of columns" do
    subject(:cols) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] }
    let(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it "returns an array of rows" do
      expect(my_transpose(cols)).to eq(rows)
    end
  end
end

describe "#stock_picker" do
  subject(:prices) { [40, 30, 22, 32, 50, 34, 52, 20] }

  it "picks the best days to buy and sell" do
    expect(stock_picker(prices)).to eq([2, 6])
  end
end

describe TowerOfHanoi do
  subject(:tower) { TowerOfHanoi.new }

  describe "#initialize" do
    let(:towers) { tower.towers }

    it "creates an array of three towers" do
      expect(towers[0]).to be_an_instance_of(Array)
      expect(towers[1]).to be_an_instance_of(Array)
      expect(towers[2]).to be_an_instance_of(Array)
    end

    it "adds three discs to the first tower" do
      expect(towers[0]).to eq([3, 2, 1])
    end
  end

  describe "#move" do
    before(:each) do
      tower.move(0, 2)
    end

    it "calls #valid_move" do
      expect(tower).to receive(:valid_move?)
      tower.move(0, 1)
    end

    it "takes disc from first tower and moves to second tower" do
      expect(tower.towers[0]).to eq([3, 2])
      expect(tower.towers[2]).to eq([1])
    end

    it "raises error if not a valid move" do
      expect { tower.move(0, 2) }.to raise_error(StandardError)
    end
  end

  describe "#won?" do
    before(:each) do
      tower.move(0, 2)
      tower.move(0, 1)
      tower.move(2, 1)
      tower.move(0, 2)
      tower.move(1, 0)
      tower.move(1, 2)
    end

    it "returns false if not won" do
      expect(tower.won?).to be false
    end

    it "returns true if won" do
      tower.move(0, 2)
      expect(tower.won?).to be true
    end
  end
end
