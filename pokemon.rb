require 'json'

class Pokemon
    attr :name, :defense, :type, :speed
    attr_accessor :hp
    def initialize(data)
        @id = data['id']
        @name = data['name']
        @hp = data['stats'][0]['base_stat']

        @type = data['types'][0]['type']['name']

        @attack = data['stats'][1]['base_stat']
        @defense = data['stats'][2]['base_stat']
        @speed = data['stats'][5]['base_stat']
    end

    def attack(oponent, types_hash)
        # Method for a pokemon to attack a given target pokemon.
        oponent.hp = oponent.hp - ( (@attack.to_f / oponent.defense  * rand(10..19)/10 * types_hash[@type][oponent.type]) )
    end
end

def battle(pokemon1, pokemon2)
    # Function for simulating a pokemon battle given 2 pokemons.
    if pokemon2.speed > pokemon1.speed 
        pokemons = [pokemon2, pokemon1]
    else 
        pokemons = [pokemon1, pokemon2]
    end

    type_chart_file = File.read('./types_chart.json')
    types_hash = JSON.parse(type_chart_file)

    while true

        pokemons[0].attack(pokemons[1], types_hash)
        if pokemons[1].hp <= 0
            puts "---------------------> Ganador #{pokemons[0].name}",""
            return pokemons[1]
        end

        pokemons[1].attack(pokemons[0], types_hash)
        if pokemons[0].hp <= 0
            puts "---------------------> Ganador #{pokemons[1].name}",""
            return pokemons[0]
        end
    end
end