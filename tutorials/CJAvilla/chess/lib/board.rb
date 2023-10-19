class Board
  # attr_reader tells me there is a member variable @grid with a public getter grid  
  attr_reader :grid
  
    # declaring static method aka class method with self.
    # essentially this creates a class instance which sets up the board then 
    # creates the pieces and puts them in their starting position
    def self.start_chess
      # in this static method, we create a class isntance? ok lets look at the constructor
      board = self.new
      
      # we instantiate a pawn with a reference to board (the class instance)
      # a pawn / piece tracks its location, its board, and its color
      # is it the case that locatino is duplicated on board and on the piece? 
      8.times do |c|
        board[[1, c]] = Pawn.new(board, [1, c], :black)
        board[[6, c]] = Pawn.new(board, [6, c], :white)
      end
     
      # an array of different piece classes (not instances)
      # each with index looks handy to get the index 
      [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |piece_klass, column|
        [[0, :black], [7, :white]].each do |(row, color)|
          location = [row, column]
          # err what is piece_klass.. oh ok this is our item in that array 
          # this is like a factory method, we instantiate the right class
          # oh look closer at the array, we're instantiating two rooks, knights and bishops
          # and in this loop we do it for black, and for white
          board[location] = piece_klass.new(
            board, 
            location,
            color
          )
        end
      end
  
      # I guess this is like return board. so the static method returns a class instance. 
      # it's like a static make method. I will have to think about reasons for doing this instead of just 
      # using a constructor.
      board
    end
  
    def initialize
      # ok this creates a multidimensional array 8x8 each cell pupulated with this nullpiece instance 
      # I will need to look further into NullPiece.instance it iz a static method coming from Singleton
      @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    end
  

    # this next method was unclear so I tried my own example
    # it lets us do something like boardinstance[[x,y]] = piece to update the grid
    # for my example
    # we put a setter method on ernie that passes two parameters (the [1,2] and the "goo") and uses them to set on faves
    # I find this weird 
    # https://rickcarlino.com/2015/square-brackets.html
    #ernie[[1,2]] = "goo"
    #puts(ernie.faves)    
    def []=(location, piece)
      row, column = location
      grid[row][column] = piece
    end
    
    # this is a getter like boardinstance[[1,2]] and it will return grid[1,2] I believe 
    def [](location)
      row, column = location
      grid[row][column]
    end
  
    # in_bounds?, empty, in_check, checkmate - useful methods and note the ? in the method name
    def in_bounds?(location)
      row, column = location
  
      row < grid.length &&
        # note use of .first instead of [0] 
        column < grid.first.length &&
        row >= 0 &&
        column >= 0
    end
  
    def empty?(location)
      row, column = location
      grid[row][column] == NullPiece.instance
    end
  
    def in_check?(color)
      # what is 'pieces', ah its a later method
      king = pieces.find {|p| p.color == color && p.is_a?(King)}
        
      # note use of nil? and raise here
      if king.nil?
        raise 'No king found.'
      end
  
      king_pos = king.location
  
      # loop over all the pieces of the opposite color
      pieces.select {|p| p.color != color }.each do |piece|
        # if any piece has an available move with the position
        # of the king with color, then color is in check.
        if piece.available_moves.include?(king_pos)
          return true
        end
      end 
  
      # what the.. I guess this is shorthand for returning false since ruby methods 
      # return the last expression evaluated by default
      false
    end
  
    def checkmate?(color)
      return false if !in_check?(color)
      color_pieces = pieces.select {|p| p.color == color }
      color_pieces.all? {|piece| piece.safe_moves.empty? }
    end
  
    def pieces
      grid.flatten.reject {|piece| piece.is_a?(NullPiece) }
    end
  
    def move_piece(start_pos, end_pos)
      # validate that end pos is in safe moves
      piece = self[start_pos]
      if !piece.safe_moves.include?(end_pos)
        raise InvalidMoveError.new(
          "End position (#{end_pos}) not in available moves: #{piece.safe_moves}"
        )
      end
      if !in_bounds?(end_pos)
        raise InvalidMoveError.new('End position not in bounds')
      end
      move_piece!(start_pos, end_pos)
    end
  
    def move_piece!(start_pos, end_pos)
      # remove the piece from the baord at the current location
      # place the piece on the board at the new location
      self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
  
      # update the piece's internal location with end pos
      self[end_pos].location = end_pos
    end
  
    def dup
      new_board = Board.new
      pieces.each do |piece|
        new_piece = piece.class.new(
          new_board, 
          piece.location, 
          piece.color
        )
        new_board[new_piece.location] = new_piece
      end
      new_board
    end
  end