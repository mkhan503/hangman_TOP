module Input
  def get_input
    puts "\nEnter your guess or enter 'save' to save current game.\nYou have #{@tries} lives left"
    @guess = gets.chomp.upcase
    if @guess == 'SAVE'
      save
    elsif is_valid?(@guess) == false 
      puts "\nInvalid Input, please enter an alphabet"
      get_input
    else
      check_guess
    end
  end

  def is_valid?(guess)
    if guess.match(/[A-Za-z]/) && guess.length == 1
      true
    else 
      false
    end

  end

=begin def save_game?
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
=end

  

end