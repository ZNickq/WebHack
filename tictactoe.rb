require 'test/unit'

class TTTTest < Test::Unit::TestCase

	def setup
		@player_test = TicTacToePlayer.new "Testy"
		@player_x = TicTacToePlayer.new "X"
		@player_0 = TicTacToePlayer.new "0"
	end

	def test_one_argument
		assert_nothing_raised do 
			@player_test.turn Hash.new
		end
	end

	def test_wrong_argument
		assert_raise RuntimeError do 
			@player_test.turn []
		end
	end

	def test_new_player
		assert_equal @player_test.name, "Testy"
	end

	def test_board_init
		game_state = @player_x.turn(Hash.new)
		@player_0.turn(game_state)
		assert game_state["owned_by_"+@player_x.name] != nil && game_state["owned_by_"+@player_0.name] != nil
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
			raise 'Wrong game state, not a hash!'
		end
		return game_state
	end

end