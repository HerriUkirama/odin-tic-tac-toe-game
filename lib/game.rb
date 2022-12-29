class Game
    attr_reader :first_player, :second_player
    @@arr = Array.new(9)
    def initialize
        
        @first_player = nil
        @second_palyer = nil
    end
    def play
        game_set_up
        get_player_name
        game_start
    end

    def symbol_check(symbol)
        until symbol != @first_player.symbol
            puts "Don't same as #{@first_player.symbol}"
            symbol = gets.chomp
        end
        symbol
    end

    def create_player(number, check_symbol = nil)
        puts "Please put the name of the player #{number}"
        name = gets.chomp
        if @first_player==nil
            puts "#{name}, Please put 1 letter which will be your marker in the game"
            symbol = gets.chomp
            Player.new(name, symbol)
        else
            puts "#{name}, Please put 1 letter which will be your marker in the game, not same  as #{@first_player.symbol}"
            symbol = gets.chomp
            if symbol == @first_player.symbol
                symbol = symbol_check(symbol)
            end
            Player.new(name, symbol)
        end
    end

    def game_set_up
        puts "Welcome to simple tic-tac-toe game! \n\n"
        @first_player = create_player(1)
        @second_player = create_player(2, first_player.symbol)
    end

    def check_winner
        @player1_win = @@board.check_player_win(@first_player.symbol)   
        @player2_win = @@board.check_player_win(@second_player.symbol)
        if(@player1_win==1)
            @first_player
        elsif (@player2_win==1)
            @second_player
        else
            nil
        end
    end

    def cell_update(number, current_player)
        if @@board.cell[number-1].to_s.match?(/[0-9]/)
            @@board.cell[number-1] = current_player.symbol
            current_player = current_player == first_player ? second_player : first_player
        else
            puts "This has been filled"
            current_player = current_player
        end
        current_player
    end

    def game_start
        @@board =Board.new

        @current_player = first_player
        
        # puts @current_player.name
        puts "\n\nLet's Begin"
        @@board.show_board
        
        until @@board.check_full ==true
            puts "#{@current_player.name}, enter number 1-9 to place '#{@current_player.symbol}' in available place "
            
            number = gets.to_i
            @current_player = cell_update(number, @current_player)

            @@board.show_board
            @check_winner = check_winner

            if @check_winner == @first_player
                puts "#{@first_player.name} winner"
                break
            elsif @check_winner == @second_player
                puts "#{@second_player.name} winner"
                break
            end   
        end

        if(@@board.check_full==true)
            puts "Tour Game is Tie"
        end
        
    end
    def get_player_name
        puts @first_player.name, @first_player.symbol
        puts @second_player.name, @second_player.symbol
    end
end

