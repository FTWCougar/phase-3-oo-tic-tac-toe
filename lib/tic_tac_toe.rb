require 'pry'

class TicTacToe
    def initialize
        @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    end

    WIN_COMBINATIONS = [
        [0,1,2],[3,4,5],[6,7,8],[0,3,6],
        [1,4,7],[2,5,8],[0,4,8],[2,4,6]
    ]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
     end
     def input_to_index(value)
        value.to_i - 1
     end
     def move(ind, token = "X")
        @board[ind] = token
     end

     def position_taken?(ind)
        @board[ind]!= " "
     end

     def valid_move?(ind)
        !position_taken?(ind) && ind.between?(0,8)
     end

     def turn_count
        @board.count{|square| square !=" "} 
     end
     
     def current_player
        if (turn_count.even?)
            "X"
        else "O"
        end
     end

     def turn
        puts "Please enter a new number"
        index = input_to_index(gets)
           if valid_move?(index)
             move(index,current_player)
             display_board
           else
            puts"invalid"
            turn
        end
    end
end