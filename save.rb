module Save
  def save
    file = File.open('game_save.txt', 'w')
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

  def from_yaml
    data = YAML.load File.read('game_save.txt')
    File.delete('game_save.txt')
    Hangman.new(data[:word], data[:letter_display], data[:display_grid], data[:incorrect_guesses], data[:tries])
  end

  
end