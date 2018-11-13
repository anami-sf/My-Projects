=begin

FIGHTING GAME

Each player has 3 attributes: name, power, health

1. Create Player class / Initialize the objects (players)
2. Define class methods
    - .hit
    - .is_alive
    - .status
    
3. Deine .fight method
4. Instantiate the class / create objects (players)
5. Play the game

=end

# 1. Initialize the objects

class Warrior
    attr_accessor :name, :power, :health

    def initialize(name, power, health)
        @name = name
        @power = power
        @health = health
    end

# 2. Define the class methods

    def is_alive
        @health > 0
    end

    def hit(warrior)
        warrior.health -= self.power
    end

    def status
        "#{name}: Power => #{power} Health => #{health}"
    end
end

# 3. Define .fight method

def fight(w1, w2)
    while w1.is_alive && w2.is_alive
        w1.hit(w2)
        w2.hit(w1)
        puts w1.status
        puts w2.status
    end

    if w1.is_alive
        puts "#{w1.name} Won!"    
    else
        puts "#{w2.name} Won!"
    end
end

# 4. Instantistiate warriors

warrior1 = Warrior.new("Nathan", 1+rand(100), 1+rand(20))
warrior2 = Warrior.new("Zeth", 1+rand(100), 1+rand(20))


# 5. Play!

puts warrior1.status
puts warrior2.status
puts fight warrior1, warrior2