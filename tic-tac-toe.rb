class GameBoard
@@a1 = "-"
@@a2 = "-"
@@a3 = "-"
@@a4 = "-"
@@a5 = "-"
@@a6 = "-"
@@a7 = "-"
@@a8 = "-"
@@a9 = "-"


#Draws a game board
def initialize
    draw_game_board()
    puts "Do you want to be X or O?"
    @userSymbol = gets.chomp
    puts "You selected #{@userSymbol}"
end

def draw_game_board 
    puts "     .     .     "
    puts "  #{@@a1}  .  #{@@a2}  .  #{@@a3}  "
    puts "     .     .     "
    puts "................."
    puts "     .     .     "
    puts "  #{@@a4}  .  #{@@a5}  .  #{@@a6}  "
    puts "     .     .     "
    puts "................."
    puts "     .     .     "
    puts "  #{@@a7}  .  #{@@a8}  .  #{@@a9}  "
    puts "     .     .     "
end

end   


new_game = GameBoard.new 


