module Save
  def save
    puts 'Please enter name for game to be saved'
    game_name = gets.chomp
    file = File.open("saved_games/#{game_name}.txt", 'w')
    file.puts(to_yaml)
    file.close
    exit
  end

  def to_yaml
    YAML.dump({
      :word => @word,
      :letter_display => @letter_display,
      :display_grid => @display_grid,
      :incorrect_guesses => @incorrect_guesses,
      :tries => @tries
    })
  end

  def from_yaml(file_name)
    data = YAML.load File.read(file_name)
    
    Hangman.new(data[:word], data[:letter_display], data[:display_grid], data[:incorrect_guesses], data[:tries], 'no')
  end

  
end