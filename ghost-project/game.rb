require_relative 'player'

class Game

    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
        @current_player = @player_1
        @fragment = ""
        @dictionary = {}
        IO.foreach('dictionary.txt') {|word| @dictionary[word.chomp] = true }
    end

    def next_player!
        @current_player = @current_player == @player_1 ? @player_2 : @player_1
    end

    def play_round
        take_turn(@current_player)
        next_player!
    end

    def valid_play?(char)
        ('a'..'z').to_a.include?(char) && dictionary.keys.each { |word| word.include?(@fragment + char) }
    end

    def take_turn(player)
        play = false

        until play
            puts "Enter a char"
        end

        play = valid_play?(gets.chomp) 

        if play
            @fragment += play
            dictionary.keys.each do |word|
                return if word == @fragment
            end
        else
            raise 'invalid move'
        end
    end
end

c = Game.new(:C, :x)
# p c.next_player!
p c.play_round

# Player 1
# Player 2
# current player?
# Fragment
# Dictionary

# get current player

# Ask the current player for a char
#  Check if the char is valid
#   If yes add to fragment
#   else ask for another char


# If fragment == word in dictionary current player gets a new letter added 

# If current players letter == ghost lose