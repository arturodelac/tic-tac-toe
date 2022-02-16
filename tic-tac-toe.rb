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
  @@win_array = [[:a1, :a2, :a3], [:b1, :b2, :b3], [:a3, :b3, :c3], [:a2, :b2, :c2], [:a1, :b1, :c1], [:c1, :c2, :c3]]
  @@winner = 0

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
  if @userSymbol != 'X' && userSymbol != 'O'
    while @userSymbol != 'X' && userSymbol != 'O' 
    puts "Do you want to be X or O?"
    @userSymbol = gets.chomp
    if if @userSymbol == 'X' && userSymbol == 'O'
      break
    end
  end 
  puts "You selected #{@userSymbol}"
  tic_tac_toe()
end
  
 #Loop for game
  def tic_tac_toe
  turn()
end
  
 #What happens in one turn
  def turn
  turn = 0
  while turn < 10
    puts "Make your move [A1-C3]"
    userMove = gets.chomp.downcase.to_sym
    if userMove != :a1 && userMove == :b1 && userMove == :c1 && userMove == :a2 && userMove == :b2 && userMove == :c2 && userMove == :a3 && userMove == :b3 && userMove == :c3
      while userMove == :a1 && userMove == :b1 && userMove == :c1 && userMove == :a2 && userMove == :b2 && userMove == :c2 && userMove == :a3 && userMove == :b3 && userMove == :c3
        puts "Please make another selection [A1-C3]"
        userMove = gets.chomp.downcase.to_sym
        p userMove
        if userMove == :a1 || userMove == :b1 || userMove == :c1 || userMove == :a2 || userMove == :b2 || userMove == :c2 || userMove == :a3 || userMove == :b3 || userMove == :c3
          break
        end
      end
    end
    userMove = userMove.to_sym

    ##Avoids user from selecting a used grid
    if @@hash[userMove] == @pcSymbol || @@hash[userMove] == @userSymbol
      while @@hash[userMove] == @pcSymbol || @@hash[userMove] == @userSymbol
        puts "Please make another selection [A1-C3]"
        userMove = gets.chomp.downcase.to_sym
        if @@hash[userMove] != @pcSymbol && @@hash[userMove] != @userSymbol
          break
        end
      end
    end
    @@hash[userMove] = @userSymbol
    pcTurn()
    draw_game_board()
    print(win_round())
    if @@winner == 1
      puts "You win!!!"
      break
    elsif @@winner == 2
      puts "PC wins!!!"
      break
    elsif turn == 8
      puts "It's a draw!!!"
      break
    else
      turn += 1
    end
  end
end
  
 ##Compares current board to list of winning lines
  def win_round
  if @@hash[@@win_array[0][0]] == @userSymbol && @@hash[@@win_array[0][1]] == @userSymbol && @@hash[@@win_array[0][2]] == @userSymbol
    @@winner = +1
  elsif @@hash[@@win_array[1][0]] == @userSymbol && @@hash[@@win_array[1][1]] == @userSymbol && @@hash[@@win_array[1][2]] == @userSymbol
    @@winner = +1
  elsif @@hash[@@win_array[2][0]] == @userSymbol && @@hash[@@win_array[2][1]] == @userSymbol && @@hash[@@win_array[2][2]] == @userSymbol
    @@winner = +1
  elsif @@hash[@@win_array[3][0]] == @userSymbol && @@hash[@@win_array[3][1]] == @userSymbol && @@hash[@@win_array[3][2]] == @userSymbol
    @@winner = +1
  elsif @@hash[@@win_array[4][0]] == @userSymbol && @@hash[@@win_array[4][1]] == @userSymbol && @@hash[@@win_array[4][2]] == @userSymbol
    @@winner = +1
  elsif @@hash[@@win_array[5][0]] == @userSymbol && @@hash[@@win_array[5][1]] == @userSymbol && @@hash[@@win_array[5][2]] == @userSymbol
    @@winner = +1
  elsif @@hash[@@win_array[0][0]] == @pcSymbol && @@hash[@@win_array[0][1]] == @pcSymbol && @@hash[@@win_array[0][2]] == @pcSymbol
    @@winner = 2
  elsif @@hash[@@win_array[1][0]] == @pcSymbol && @@hash[@@win_array[1][1]] == @pcSymbol && @@hash[@@win_array[1][2]] == @pcSymbol
    @@winner = 2
  elsif @@hash[@@win_array[2][0]] == @pcSymbol && @@hash[@@win_array[2][1]] == @pcSymbol && @@hash[@@win_array[2][2]] == @pcSymbol
    @@winner = 2
  elsif @@hash[@@win_array[3][0]] == @pcSymbol && @@hash[@@win_array[3][1]] == @pcSymbol && @@hash[@@win_array[3][2]] == @pcSymbol
    @@winner = 2
  elsif @@hash[@@win_array[4][0]] == @pcSymbol && @@hash[@@win_array[4][1]] == @pcSymbol && @@hash[@@win_array[4][2]] == @pcSymbol
    @@winner = 2
  elsif @@hash[@@win_array[5][0]] == @userSymbol && @@hash[@@win_array[5][1]] == @userSymbol && @@hash[@@win_array[5][2]] == @userSymbol
    @@winner = 2
  else
  end
end
  
 #Computer logic
  def pcTurn
  if @userSymbol == "X"
    @pcSymbol = "O"
  else
    @pcSymbol = "X"
  end
  pcChoice = rand(0..8)
  ##Avoids pc from selecting a used grid
  if @@hash[@@hash.keys[pcChoice]] == @pcSymbol || @@hash[@@hash.keys[pcChoice]] == @userSymbol
    while @@hash[@@hash.keys[pcChoice]] == @pcSymbol || @@hash[@@hash.keys[pcChoice]] == @userSymbol
      pcChoice = rand(0..8)
      if @@hash[@@hash.keys[pcChoice]] != @userSymbol && @@hash[@@hash.keys[pcChoice]] != @pcSymbol
        @@hash[@@hash.keys[pcChoice]] = @pcSymbol
        break
      end
    end
  else
    @@hash[@@hash.keys[pcChoice]] = @pcSymbol
  end
end end

new_game = Game.new
