# code for checking input
module Check 
  def check_guess
    @word.each_with_index{ |char, i| correct(char,i) if char == @guess } 
    is_correct = @word.each.any?{ |char| char == @guess}
    incorrect if is_correct == false
    display_final_grid
    @word.eql?(@letter_display) ? play_again?('win') : get_input
  end

  def incorrect
    @tries -= 1
    @incorrect_guesses << @guess   
    case @tries
    when 5
      @display_grid[3][3] = '  O'
    when 4
      @display_grid[4][3] = '  |'
      @display_grid[5][3] = '  |'
    when 3
      @display_grid[4][3] = " \\|"
    when 2
      @display_grid[4][3] = " \\|/"
    when 1
      @display_grid[6][3] = " /"
    when 0
      @display_grid[6][3] = " / \\"
      display_final_grid
      play_again?('lose')
    end
      display_final_grid
      
      get_input
  end

  def correct(char, i)
    @letter_display[i] = "#{char}"
    
  end
end