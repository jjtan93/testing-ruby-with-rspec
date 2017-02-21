require "02_enumerable_methods"

describe "#my_each" do
  context "given [a, b, c, d, e]" do
    it "returns [a, b, c, d, e] when each element is collected" do
      arr = %w{a b c d e}
      result = []
      arr.my_each do |element|
        result += Array(element)
      end
      expect(result).to eql(arr)
    end
  end
end

describe "#my_each_with_index" do
  context "given an array of length 5" do
    it "returns [0, 1, 2, 3, 4] when each index is collected" do
      arr = %w{a b c d e}
      result = []
      arr.my_each_with_index do |element, index|
        result += Array(index)
      end
      expect(result).to eql([0, 1, 2, 3, 4])
    end
  end
end

describe "#my_select" do
  context "given [1, 2, 3, 4, 5, 6] with a block {element % 2 ==0}" do
    it "returns [2, 4, 6]" do
      expect([1, 2, 3, 4, 5, 6].my_select{|element| element % 2 ==0}).to eql([2, 4, 6])
    end
  end
end

describe "#my_all?" do
  context "given [2, 4, 6, 8] with block {element % 2 == 0}" do
    it "returns true" do
      expect([2, 4, 6, 8].my_all?{|element| element % 2 == 0}).to eql(true)
    end
  end
  
  context "given [2, 4, 6, 8, 1] with block {element % 2 == 0}" do
    it "returns false" do
      expect([2, 4, 6, 8, 1].my_all?{|element| element % 2 == 0}).to eql(false)
    end
  end
end

