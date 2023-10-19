module Slideable
    def available_moves
      moves = []
  
      # move_dirs is defined where? as a method on any Piece base class that includes slideable
      # oh it is no stepable too.. at least king
      move_dirs.each do |(dr, dc)|
        current_r, current_c = location
  
        loop do
          current_r += dr
          current_c += dc
          loc = [current_r, current_c]
          break if !board.in_bounds?(loc)
          if board.empty?(loc)
            moves << loc
          end      
          if enemy?(loc)
            moves << loc
            break
          end
        end
      end
      moves
    end
  end