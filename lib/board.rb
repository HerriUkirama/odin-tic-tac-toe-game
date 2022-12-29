class Board

    attr_reader :cell

    WIN_COMBINATION = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize
        @cell = Array.new(9) {|n| n+1 } 
    end

    def show_board
        puts "\n
         #{@cell[0]} | #{@cell[1]} | #{@cell[2]}
        ---+---+---
         #{@cell[3]} | #{@cell[4]} | #{@cell[5]}
        ---+---+---
         #{@cell[6]} | #{@cell[7]} | #{@cell[8]}
        \n"
    end
    

    def check_full
        @cell.all? {|number| number.to_s.match(/[^0-9]/)}
    end

    def check_player_win(symbol)
        win=0
        WIN_COMBINATION.each_with_index do |row, index|
            if @cell[row[0]] == @cell[row[1]] &&  @cell[row[1]] == @cell[row[2]] && @cell[row[2]] == symbol
                win = 1
            end
        end
        win
    end

    # def change_to_symbol(symbol,position)
    #     if @@cell[position-1] != 
    # end
end