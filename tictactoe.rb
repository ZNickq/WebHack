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

	def test_board_play
		game_state = @player_x.turn(Hash.new)
		isX = true
		moves = 0
		while game_state["message"] == nil
			if isX
				game_state = @player_x.turn(game_state)
			else
				game_state = @player_0.turn(game_state)
			end
			isX = !isX
			moves = moves + 1
			break if moves == 9
		end
		assert game_state["message"] != nil , "Game didn't finish properly!"
		puts game_state["message"]
	end


end

class TicTacToePlayer
 	BOARD = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
  	WINNING_COMBINATIONS = [[:a1, :a2, :a3],
                          [:b1, :b2, :b3],
                          [:c1, :c2, :c3],
                          [:a1, :b1, :c1],
                          [:a2, :b2, :c2],
                          [:a3, :b3, :c3],
                          [:a1, :b2, :c3],
                          [:c1, :b2, :a3]]

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
		if game_state["owned_by_"+@name] == nil 
			game_state["owned_by_"+@name] = []
		end
		temp = BOARD
		endCheck = 0
		game_state.each { |key, value| 
			temp = temp - value
			endCheck = endCheck + value.size
		}
		if endCheck == 9
			game_state["message"] = "Game over, nobody won!"
			return game_state
		end
		game_state["owned_by_"+@name] << temp.sample
      		WINNING_COMBINATIONS.each do |wcomb|
			if (wcomb - game_state["owned_by_"+@name]).empty?
				game_state["message"]="Game over, "+@name+" won!"
			end
		end
		return game_state
	end

end