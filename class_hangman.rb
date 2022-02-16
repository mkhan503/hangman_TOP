
#hangman game

class Hangman

  include Output, Input, Check, Save

  dictionary = File.readlines('dictionary.txt')
  DICTIONARY = dictionary.map!{|word| word.chomp}.delete_if{ |word| word.length < 5 || word.length > 12}

  def initialize
    display_initial_message
    game_status = new_or_saved
    if game_status == 'new'
      @word = select_word.split('') 
      @letter_display = []
      @display_grid = {}
      @incorrect_guesses = []
      @tries = 6
    else
      data = YAML.load File.read(game_status)
      @word = data[:word]
      @letter_display = data[:letter_display]
      @display_grid = data[:display_grid]
      @incorrect_guesses = data[:incorrect_guesses]
      @tries = data[:tries]
    end
    @guess = ''
    display
    get_input
  end

  def select_word
    self.class::DICTIONARY[rand(0..self.class::DICTIONARY.length - 1)].upcase
  end

  def display_initial_message
    puts "\nWelcome to Hangman!\n"
  end

  def new_or_saved
    puts "\nWould you like to:
    1) Start a new game
    2) Resume a saved game"

    game_status = gets.chomp
    if game_status == '2'
      puts 'Choose one of the following games:'
      saved_games = Dir.glob('saved_games/*')
      saved_games.each { |file| puts file.delete_prefix("saved_games/").delete_suffix(".txt")}
      get_game_name
    elsif game_status == '1'
      'new'
    else
      puts 'Invalid Input'
      new_or_saved
    end
    
  end

  def get_game_name
    name = gets.chomp
    name = "saved_games/#{name}.txt"
    unless File.exists?(name)
      puts 'Invalid file name. Please enter name again'
      get_game_name
    end
    name
  end
end
