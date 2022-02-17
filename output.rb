module Output
  def display
    if @letter_display.empty? 
      @word.length.times { @letter_display << "___ "}
      defualt_display
    else
      display_final_grid
    end
  end

  def defualt_display
    for i in (1..6)
      @display_grid[i] = ['|','  ','  ',' ']
    end
    @display_grid[1] = [' _ ','_ ','_ ',' ']
    @display_grid[2][2] = '    |'
    display_final_grid
  end

  def display_final_grid
    @display_grid.each_value{ |value| puts value.join('') }
    puts 
    puts @letter_display.join('  ')
    puts "\nIncorrect guesses: #{@incorrect_guesses.join(' ')}" if @incorrect_guesses.length > 0
  end

  def play_again?(string)
    string == 'lose' ?  puts("\nYou lose! \nThe word was: #{@word.join('')}")  : puts("\nYou win!")
    puts "\nWould you like to play again?(y/n)"
    ans = gets.chomp
    ans.downcase == 'y' ? Hangman.new : exit 
  end
end
