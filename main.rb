require_relative 'app'
require_relative 'show_menu'
require_relative 'options'
require_relative 'introduction'

# cross check
class Main
  include MenuMethods
  include Options
  include Introductions

  def initialize
    @app = App.new
  end

  def run
    welcome_message
    loop do
      show_menu
      selected = getuser_input
      break if selected == 7

      select_option(selected, @app)
    end
    exit_message
  end
end

main = Main.new
main.run
