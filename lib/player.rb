require "pry"

class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(x)
		@life_points = @life_points - x
		if @life_points > 1 
			
		else 
			puts "#{@name} a été tué"
		end
	end 

	def attacks(player_attacked)
		puts "#{@name} attaque #{player_attacked.name}"
		randon_damage_generated = compute_damage
		player_attacked.gets_damage(randon_damage_generated)
		puts "Il lui infllige #{randon_damage_generated} points de dégâts"
	end

	def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{@name} a une arme de niveau #{weapon_level} et a #{@life_points} points de vie"
	end


	def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else 
      puts "Gardes l'ancienne hmah que tu es" 
    end
  end
  
  def search_health_pack
    cube_number = rand(1..6)
    puts "Tu as fais un #{cube_number}"
    if cube_number == 1
      puts "Tu n'as rien trouvé"
    elsif 2 <= cube_number && cube_number <= 5
      puts "Bravo tu as trouvé un pack de 50 points de vie"
      if @life_points < 50
        @life_points = @life_points + 50
      else 
        @life_points = 100
      end
    elsif cube_number == 6
      puts "WAW Tu as trouvé un pack de 80 points de vie"
      if @life_points < 20
        @life_points = @life_points + 80
      else 
        @life_points = 100
      end
    end
  end
 end

binding.pry
puts "end of file"


