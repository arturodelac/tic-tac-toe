module GameBoard
    @@hash = {
        a1: "-",
        a2: "-",
        a3: "-",
        b1: "-",
        b2: "-",
        b3: "-",
        c1: "-",
        c2: "-",
        c3: "-",
    }
    
    def draw_game_board 
    puts "   A     B     C  "
    puts "      .     .     "
    puts "1  #{@@hash[:a1]}  .  #{@@hash[:b1]}  .  #{@@hash[:c1]}  "
    puts "      .     .     "
    puts " ................."
    puts "      .     .     "
    puts "2  #{@@hash[:a2]}  .  #{@@hash[:b2]}  .  #{@@hash[:c2]}  "
    puts "      .     .     "
    puts " ................."
    puts "      .     .     "
    puts "3  #{@@hash[:a3]}  .  #{@@hash[:b3]}  .  #{@@hash[:c3]}  "
    puts "      .     .     "
end
    
   
end

class Game include GameBoard
 
#Draws a game board
def initialize
    draw_game_board()
    start_game()
end

#Stores user symbol and starts the game
def start_game
    puts "Do you want to be X or O?"
    @userSymbol = gets.chomp
    puts "You selected #{@userSymbol}"
    tic_tac_toe()
end

#Loop for game
def tic_tac_toe
    turn()
end

#What happens in one turn
def turn
    puts "Make your move [A1-C3]"
    userMove = gets.chomp.downcase.to_sym
    @@hash[userMove]=@userSymbol
    pcTurn()
    draw_game_board()
end

#Computer logic
def pcTurn
    pcSymbol = "O"
    pcChoice = rand(0..8)
    @@hash[@@hash.keys[pcChoice]] = pcSymbol

end   
end


new_game = Game.new 


