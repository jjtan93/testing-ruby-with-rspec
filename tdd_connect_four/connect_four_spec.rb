require 'connect_four'

describe ConnectFour do
  describe "#insert_at" do
    context "when a disc from player 1 is dropped into a column" do
      cf = ConnectFour.new
      old_height = cf.height[3]
      result = cf.insert_at(3, 1)
      
      it "returns true" do
        expect(result).to eql(true)
      end
      
      it "the topmost disc is a disc from player 1" do
        topmost_disc = cf.board[cf.height[3] - 1][3]
        expect(topmost_disc).to eql(1)
      end
      
      it "the height of the column increases by 1" do
        expect(cf.height[3]).to eql(old_height + 1)
      end
    end
    
    context "when a disc is inserted into an already full column" do
      cf = ConnectFour.new
      it "returns false" do
        cf.height[3] = 6
        expect(cf.insert_at(3, 1)).to eql(false)
      end
    end
    
  end
  
  describe "#win_condition_met?" do
    context "when a win condition has not been met" do
      cf = ConnectFour.new
      it "returns false" do
        expect(cf.win_condition_met?(1)).to eql(false)
      end
    end
    
    context "when a win condition has been met (4x horizontal)" do
      cf = ConnectFour.new
      cf.board[3][1] = 2
      cf.board[3][2] = 2
      cf.board[3][3] = 2
      cf.board[3][4] = 2
      
      it "returns true" do
        expect(cf.win_condition_met?(2)).to eql(true)
      end
    end
    
    context "when a win condition has been met (4x vertical)" do
      cf = ConnectFour.new
      cf.board[2][3] = 2
      cf.board[3][3] = 2
      cf.board[4][3] = 2
      cf.board[5][3] = 2
      
      it "returns true" do
        expect(cf.win_condition_met?(2)).to eql(true)
      end
    end
    
    context "when a win condition has been met (4x right diagonal)" do
      cf = ConnectFour.new
      # TODO <<<<<<<
      cf.board[2][3] = 1
      cf.board[3][4] = 1
      cf.board[4][5] = 1
      cf.board[5][6] = 1
      
      it "returns true" do
        expect(cf.win_condition_met?(1)).to eql(true)
      end
    end
    
    context "when a win condition has been met (4x left diagonal)" do
      cf = ConnectFour.new
      # TODO <<<<<<<
      cf.board[2][6] = 1
      cf.board[3][5] = 1
      cf.board[4][4] = 1
      cf.board[5][3] = 1
      
      it "returns true" do
        expect(cf.win_condition_met?(1)).to eql(true)
      end
    end
  end  
  
end