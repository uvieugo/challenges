class Game
    attr_accessor :player_x, :player_o, :board

    def initialize(player_x, player_o)
        @player_x = Player.new(player_x, "x", "player_x")
        @player_o = Player.new(player_o, "o", "player_o")
        @board = Board.new
    end

    def play
        puts "Start Game"
        self.board.show_grid
        # default start player = player_x
        current_player = self.player_x
        no_of_moves = 1
        while no_of_moves <= 9 do
            # puts no_of_moves
            # display to start if first round, or your turn in other rounds
            if no_of_moves == 1
                puts "#{current_player.nick} to start, where do you want to play? g1 - g9"
            else
                puts "Your turn #{current_player.nick}, where do you want to play? g1 - g9"
            end
            answer = gets.chomp
            case answer
                when "1"
                    if self.board.g1 == " "
                        self.board.g1 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "2"
                    if self.board.g2 == " "
                        self.board.g2 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "3"
                    if self.board.g3 == " "
                        self.board.g3 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "4"
                    if self.board.g4 == " "
                        self.board.g4 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "5"
                    if self.board.g5 == " "
                        self.board.g5 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "6"
                    if self.board.g6 == " "
                        self.board.g6 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "7"
                    if self.board.g7 == " "
                        self.board.g7 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "8"
                    if self.board.g8 == " "
                        self.board.g8 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                when "9"
                    if self.board.g9 == " "
                        self.board.g9 = current_player.token #put player token in grid
                    else
                        puts "play on another box"
                        redo
                    end
                else
                    "invalid grid number"
                    redo
            end

            self.board.show_grid

            if check_win?
                puts "#{current_player.nick} wins"
                break
            end

            if current_player == self.player_x
                current_player = self.player_o
            elsif current_player == self.player_o
                current_player = self.player_x 
            end

            no_of_moves +=1

            if no_of_moves == 10
                puts "Tie!! Do you want to play again(Yes or No)"
                answer = gets.chomp
                if answer == yes
                    "Not figured how to implement this yet..but soon."
                    break
                else
                    break
                end
            end
            
        end
        
    end

    def check_win?
        g1 = self.board.g1
        g2 = self.board.g2
        g3 = self.board.g3
        g4 = self.board.g4
        g5 = self.board.g5
        g6 = self.board.g6
        g7 = self.board.g7
        g8 = self.board.g8
        g9 = self.board.g9

        win1 = ((g1 == g2) && (g2 == g3) && (g3 == g1)) && ( (g1 != " ") && (g2 != " ") && (g3 != " ") )
        win2 = ((g4 == g5) && (g5 == g6) && (g6 == g4)) && ( (g4 != " ") && (g5 != " ") && (g6 != " ") )
        win3 = ((g7 == g8) && (g8 == g9) && (g9 == g7)) && ( (g7 != " ") && (g8 != " ") && (g9 != " ") )
        win4 = ((g1 == g4) && (g4 == g7) && (g7 == g1)) && ( (g1 != " ") && (g4 != " ") && (g7 != " ") )
        win5 = ((g2 == g5) && (g5 == g8) && (g8 == g2)) && ( (g2 != " ") && (g5 != " ") && (g8 != " ") )
        win6 = ((g3 == g6) && (g6 == g9) && (g9 == g6)) && ( (g3 != " ") && (g6 != " ") && (g9 != " ") )
        win7 = ((g1 == g5) && (g5 == g9) && (g9 == g1)) && ( (g1 != " ") && (g5 != " ") && (g9 != " ") )
        win8 = ((g3 == g5) && (g5 == g7) && (g7 == g3)) && ( (g3 != " ") && (g5 != " ") && (g7 != " ") )
        
        if (win1)
            true
        elsif (win2)
            true
        elsif (win3)
            true
        elsif (win4)
            true
        elsif (win5)
            true
        elsif (win6)
            true
        elsif (win7)
            true
        elsif (win8)
            true
        else
            false
        end
    end
    
end

class Player
    attr_accessor :name, :token, :nick
    def initialize(name, token, nick)
        @name = name
        @token = token
        @nick = nick
    end
    
end

class Board
    attr_accessor :top_row, :mid_row, :bot_row, :g1, :g2, :g3, :g4, :g5, :g6, :g7, :g8, :g9
    def initialize
        @g1, @g2, @g3, @g4, @g5, @g6, @g7, @g8, @g9 = [" "," "," "," "," "," "," "," "," "]
    end

    def show_grid
        @top_row = [@g1, @g2, @g3]
        @mid_row = [@g4, @g5, @g6]
        @bot_row = [@g7, @g8, @g9]
        puts @top_row.join("|")
        puts @mid_row.join("|")
        puts @bot_row.join("|")
    end
end

game = Game.new("eric", "ugo")
game.play
