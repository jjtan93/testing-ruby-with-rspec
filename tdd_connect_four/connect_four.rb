class ConnectFour
  attr_accessor :board, :height
  
  def initialize
    @game_over = false
    @player = 1
    
    # Initialize the board
    @board = []
    6.times do
      @board << [-1, -1, -1, -1, -1, -1, -1]
    end
    
    # Current position for a disc to be inserted in each individual column
    @height = []
    7.times do
      @height += Array(0)
    end
  end
  
  # Insert a disc from the given player at the given column
  # Returns true if the operation is successful, false otherwise
  def insert_at(column, player)
    return false if(@height[column] > 5)
    
    # Insert a disc at the next possible slot in the specified column
    @board[@height[column]][column] = player
    @height[column] += 1
    return true
  end
  
  # Returns the given input as an integer
  def prompt
    print "Which column do you wish to enter a disc in (0-6): "
    return gets.chomp.to_i
  end
  
  # Checks to see if a win condition has been met for the specified player
  # Returns true if true, false otherwise
  def win_condition_met?(player)
    # Horizontal
    for row in (0..5) do
      counter = 0
      
      @board[row].each do |disc|
        if(disc == player)
          counter += 1
          return true if(counter >= 4)
        else
          counter = 0
        end
      end
    end
    
    # Vertical
    for col in (0..6) do
      counter = 0
      
      for row in (0..5) do
        if(@board[row][col] == player)
          counter += 1
          return true if(counter >= 4)
        else
          counter = 0
        end
      end
    end
    
    # Right diagonal
    starting_points = [[0, 0], [1, 0], [2, 0], [0, 1], [0, 2], [0, 3]]
    starting_points.each do |start|
      counter = 0
      
      row = start[0]
      col = start[1]
      
      while(row < 6 && col < 7)
        if(@board[row][col] == player)
          counter += 1
          return true if(counter >= 4)
        else
          counter = 0
        end
        
        row += 1
        col += 1
      end
    end
    
    # Left diagonal
    starting_points = [[0, 6], [1, 6], [2, 6], [0, 5], [0, 4], [0, 3]]
    starting_points.each do |start|
      counter = 0
      
      row = start[0]
      col = start[1]
      
      while(row < 6 && col >= 0)
        if(@board[row][col] == player)
          counter += 1
          return true if(counter >= 4)
        else
          counter = 0
        end
        
        row += 1
        col -= 1
      end
    end
      
    return false
  end
  
  # Prints out the current board state on the console
  #| 1 | 2 | 3 | 4 | 5 | 6 | 7 |
  #------------------------------
  #| 1 | 2 | 3 | 4 | 5 | 6 | 7 |
  def display_board
    # Reverse it to display the board correctly
    reverse = @board.reverse
    
    puts "------------------------------"
    reverse.each do |row|
      print "|"
      row.each do |col|
        print " #{col} |" if(col != -1)
        print "   |" if(col == -1)
      end
      puts "\n------------------------------"
    end
  end
  
  # Runs the entire Connect Four game
  def run
    while(!@game_over)
      valid_input = false
      input_column = -1
      
      display_board
      puts ">>> Player #{@player}'s turn."
      
      # Repeatedly prompts the user for input until valid input is given
      while(!valid_input)
        input_column = prompt
        
        # Requests input again if the input given is invalid
        valid_input = true if((0..6).include? input_column)
        if(!valid_input)
          puts "Invalid input! Please try again."
          next
        end
        
        # Requests input again if the specified column is already full
        valid_insertion = insert_at(input_column, @player)
        if(!valid_insertion)
          puts "\nERROR: The column is already full! Please try again." 
          valid_input = false
        end
      end
      
      # Check to see if game is won
      break if(win_condition_met?(@player))
      
      # Swap players after each turn
      if(@player == 1)
        @player = 2
      elsif(@player == 2)
        @player = 1
      end
      
    end
    
    display_board
    puts ">>> Player #{@player} has won!!! <<<"
  end
end

cf = ConnectFour.new
cf.run