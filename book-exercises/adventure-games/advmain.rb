# Bitwise Books http://www.bitwisebooks.com
require "./advinit"

$commands = { "n" => :n, "s" => :s, "e" => :e, "w" => :w,
              "q" => :quit, "quit" => :quit,
              "take" => :take, "get" => :take,
              "drop" => :drop,
              "look" => :look }

$gameRunning = true

class Adventure
  def initialize
    @imp = createAdventure
  end

  def isDirection(command)
    return [:n, :s, :e, :w].include?(command)
  end

  def processInput(input)
    command = $commands[input]
    if (command == nil)
      puts("Sorry, I don't understand '#{input}'!")
    elsif (command == :quit)
      puts("Game end")
      $gameRunning = false
    elsif (isDirection(command))
      puts(@imp.moveTo(command))
    else
      puts("Command #{command} not yet implemented")
    end
  end

  def rungame
    input = ""
    while ($gameRunning)
      print("> ")
      input = gets.downcase.chomp
      processInput(input)
    end
  end
end

@adv = Adventure.new
@adv.rungame
