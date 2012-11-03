require 'test/unit'

class TTTTest < Test::Unit::TestCase

	def setup
		@player_test = TicTacToePlayer.new "X"
	end

	def test_one_argument
		assert_nothing_raised do 
			@player_test.turn []
		end
	end

	def test_new_player
		assert_equal @player_test.name, "X"
	end


end

class TicTacToePlayer

	def name
		return @name
	end
	
	def initialize (name)
		@name = name
	end

	def turn(game_state)
		if(game_state.class != Hash)
			return game_state
		end
	end

end