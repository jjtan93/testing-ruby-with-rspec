class TicTacToe
  attr_accessor :board
  
  def initialize
    @board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    #board2 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @game_over = false
    @current_player = 1
    @winner = -1
    @moves_made = 0
  end
  
  public
  def run
    #@game_over = game_over? 
    
    while(!@game_over)
      drawBoard
      prompt
      @game_over = game_over? 
      if(!@game_over && @current_player == 1)
        @current_player = 2
      elsif(!@game_over && @current_player == 2)
        @current_player = 1
      end
      #@game_over = true
    end
    
    drawBoard
    puts "Player #{@winner} has won!" if(@winner != -1)
    puts "Game ended in a draw" if(@winner == -1)
  end
  
  # Prints the current board state
  def drawBoard
    @board.each do |element|
      print "#{element} "
      puts ""
    end
  end
  
  def prompt
    valid_move = false
    
    while(!valid_move)
      puts "Player #{@current_player}'s turn. Please enter a valid move (eg. row column - 1 3):"
      input = gets.chomp
      input = input.split(" ")
      row = input[0].to_i
      col = input[1].to_i
      
      if(row > 2 || col > 2 || @board[row][col] != 0)
        puts "Invalid move! Please try again."
        next
      else
        @board[row][col] = @current_player
        valid_move = true
      end
    end
    
    @moves_made += 1
  end
  
  def game_over?
    # The current solution is not DRY, can combine both hor + vert by swapping array elements?
    
    # Horizontal row checking
    (0..2).each do |row|
      p1_counter = 0
      p2_counter = 0
      (0..2).each do |col|
        p1_counter += 1 if @board[row][col] == 1
        p2_counter += 1 if @board[row][col] == 2
      end
      
      @winner = 1 if(p1_counter == 3)
      @winner = 2 if(p2_counter == 3)
      return true if(@winner != -1)
    end
    
    # Vertical col checking
    (0..2).each do |col|
      p1_counter = 0
      p2_counter = 0
      (0..2).each do |row|
        p1_counter += 1 if @board[row][col] == 1
        p2_counter += 1 if @board[row][col] == 2
      end
      
      @winner = 1 if(p1_counter == 3)
      @winner = 2 if(p2_counter == 3)
      return true if(@winner != -1)
    end
    
    # Diagonal check
    # 00, 11, 22 && 20, 11, 02
    
    # Upper left to lower right diagonal
    p1_ul2lr_counter = 0
    p2_ul2lr_counter = 0
    
    # Lower left to upper right diagonal
    p1_lr2ul_counter = 0
    p2_lr2ul_counter = 0 
    row_counter = 2
    
    # Treat the row var as col for lower left to upper right diagonal
    (0..2).each do |row|
      
      p1_ul2lr_counter += 1 if @board[row][row] == 1
      p2_ul2lr_counter += 1 if @board[row][row] == 2
      
      p1_lr2ul_counter += 1 if @board[row_counter][row] == 1
      p2_lr2ul_counter += 1 if @board[row_counter][row] == 2
      
      row_counter -= 1
    end
    
    @winner = 1 if(p1_ul2lr_counter == 3 || p1_lr2ul_counter == 3)
    @winner = 2 if(p2_ul2lr_counter == 3 || p2_lr2ul_counter == 3)
    return true if(@winner != -1)
    
    return true if(@moves_made == 9)
    return false
  end
  
end

#ttt = TicTacToe.new
#ttt.run