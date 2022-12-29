
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'


def start_game
    game = Game.new
    game.play
    restart_game
end


def restart_game
    puts "Do you want to restart the game? [Y/N]"
    answer = gets.chomp
    # answer == "Y" ? start_game : puts "thanks"
    if answer == "Y"
        puts "\n\n"
        start_game
    else
        puts "Thank U"
    end
end

start_game


# board = Board.new
# board.show_board