
#hangman game

class Hangman

  include Output, Input, Check, Save

  dictionary = File.readlines('dictionary.txt')
  DICTIONARY = dictionary.map!{|word| word.chomp}.delete_if{ |word| word.length < 5 || word.length > 12}

  #attr_accessor :word, :letter_display, :display_grid, :incorrect_guesses, :tries

  def initialize(word = select_word.split('') ,letter_display = [], display_grid = {}, incorrect_guesses = [], tries = 6)
   
    if File.exists?('game_save.txt')
      puts 'Would you like to restart your last saved game?(y/n)'
      ans = gets.chomp.downcase
      if ans == 'y' 
        from_yaml
      elsif ans == 'n'
      
      else
        puts "Invalid Input, please enter y or n"
        Hangman.new
      end
    end
    @word = word
    @letter_display = letter_display
    @display_grid = display_grid
    @guess = ''
    @incorrect_guesses = incorrect_guesses
    @tries = tries
    display_initial_message
    display
    get_input
  end

  def select_word
    self.class::DICTIONARY[rand(0..self.class::DICTIONARY.length - 1)].upcase
  end

  def display_initial_message
    puts "\n Welcome to Hangman! You will have 6 tries to guess the word.\n"
  end

 

  



end
