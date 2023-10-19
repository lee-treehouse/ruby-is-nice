class Bishop < Piece
    include Slideable
    
    # where does :black come from? this is a symbol right? is it a constant? 
    def to_s
      color == :black ? "♝" : "♗"
    end
  
    def move_dirs
      [
        [1, 1],
        [1, -1],
        [-1, 1],
        [-1, -1],
      ]
    end
  end