require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")


while player1.life_points > 0 && player2.life_points > 0
  
puts "   "
  
puts "Voici les POINT DE VIE des joueurs : "
player1.show_state
player2.show_state
  
puts "  "

puts "Passons à la phase de COMBAT : "
player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
player2.attacks(player1)
  
end

puts "!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!"
  if player1.life_points <= 0
	  puts "#{player2.name} a battu #{player1.name} 🥇 !"
  else 
	  puts "#{player1.name} a battu #{player2.name} 💪🏼!"
  end
puts "!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!-!"

binding.pry