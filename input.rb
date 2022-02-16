module Input
  def get_input
    puts "\nEnter your guess, you have #{@tries} lives left:"
    @guess = gets.chomp.upcase
    if is_valid?(@guess) == false
      puts "Invalid Input, please enter an alphabet"
      get_input
    else
      check_guess
    end
  end

  def is_valid?(guess)
    guess.match(/[A-Za-z]/) ? true : false
  end

  def save_game?
    puts "\nWould you like to save the game?(y/n)"
    ans = gets.chomp.downcase
    if ans == 'y' 
      save
    elsif ans == 'n'
      return
    else 
      puts 'Invalid Input'
      save_game?
    end
  end

  

end