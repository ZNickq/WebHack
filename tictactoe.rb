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

end

class TicTacToePlayer


	def initialize (name)
		@name = name
	end

	def turn(game_state)
		raise 'Not implemented yet!'
	end

end