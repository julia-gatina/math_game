    require "./players"

class Game

  def start
    puts "---- New Game ----"
    puts "please enter name for player 1, one word"
    @p1 = Player.new(gets.chomp, 3)
    puts "please enter name for player 2, one word"
    @p2 =  Player.new(gets.chomp, 3)
    @current_player = @p1
    @other_player = @p2
    set_question
  end

  def set_question
    num_1 = rand(1..20)
    num_2 = rand(1..20)
    @correct_answer = num_1 + num_2
    puts "#{@current_player.name}: What does #{num_1} + #{num_2} equal?"
    @player_answer = gets.chomp.to_i
    is_correct
  end  

  def is_correct
    if @correct_answer == @player_answer
      puts "#{@current_player.name}: YES. You are correct!"
      check_score
    else 
      puts "#{@current_player.name}: Seriously? No!"
      @other_player.lose_life
      check_score
    end
  end

  def check_score
    if @current_player.life < 1
      game_over(@other_player)
  
    elsif @other_player.life < 1
      game_over(@current_player)
    
    else show_score  
    end
  end

  def show_score
    puts "#{@current_player.name} #{@current_player.life}/3 VS #{@other_player.name} #{@other_player.life}/3"
    puts '----- NEW TURN -----'
    rotate_players
  end  

  def rotate_players
    @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
    @other_player == @p2 ? @other_player = @p1 : @other_player = @p2
    set_question
  end   

  def game_over(winner)
    puts "#{winner.name} wins with a score of #{winner.life}/3 "
    puts "---- GAME OVER ----"
    puts "Good Bye!"
  end  
  end

