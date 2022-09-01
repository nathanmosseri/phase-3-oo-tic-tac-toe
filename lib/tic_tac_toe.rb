class TicTacToe

    
    def initialize
        @board = [' ', ' ', ' ', ' ', ' ',' ',' ',' ',' ']
    end
    
    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]


    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(i, token = x)
        @board[i] = token
    end

    def position_taken?(i)
        @board[i] != ' '
    end

    def valid_move?(i)
        !position_taken?(i) && i.between?(0,8)
    end

    def turn_count
        @board.count {|square| square != ' '}
    end

    def current_player
        turn_count.even? ? 'X' : 'O'
    end

    def turn
        puts "Please enter a number (1-9):"
        input = gets.strip
        i = input_to_index(input)
        if valid_move?(i)
            token = current_player
            move(i, token)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
    end

    def full?
        !@board.include?(' ')
    end

    def draw?
        !@board.include?(' ') && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if combo = won?
            @board[combo[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end