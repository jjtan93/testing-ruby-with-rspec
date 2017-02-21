require "01_tictactoe"

describe TicTacToe do
  describe "#game_over?" do
    context "when the win condition has been met" do
      
      ttt = TicTacToe.new
      
      it "returns true (horizontal)" do
        ttt.board[0] = [1, 1, 1]
        expect(ttt.game_over?).to eql(true)
      end
      
      it "returns true (vertical)" do
        for i in (0..2)
          ttt.board[i][-1] = 1
        end
        expect(ttt.game_over?).to eql(true)
      end
      
      it "returns true (diagonal)" do
        for i in (0..2)
          ttt.board[i][i] = 1
        end
        expect(ttt.game_over?).to eql(true)
      end
    end
  end
  
  
end