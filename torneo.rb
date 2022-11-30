require 'uri'
require 'net/http'
require 'json'
require 'io/console'    
require_relative 'pokemon'
require_relative 'utils'

messages = ["Cuartos de final", "Semifinal", "Final"]

participants = []
for a in 1..8 do
    id = rand(1..151)
    data = get_pokemon_data(id)
    participants.append(Pokemon.new(data))
end

puts "","Torneo Pokemon",""

for phase in 0..2 do
    battles = participants.length() / 2

    puts messages[phase]

    fixture_node(reshape_array(participants))
    puts ""

    defeated = []
    for i in 0..battles - 1
        puts "#{participants[i*2].name} vs #{participants[i*2 + 1].name} :"
        defeated.append( battle(participants[i*2],participants[i*2 + 1]) )
    end

    defeated.reverse.each { |x| participants.delete(x) }

    puts "> Presione Enter para continuar"                                                                                                    
    STDIN.getch
end


puts "Ganador del torneo: #{participants[0].name}",""

puts "Presione Enter para finalizar"
STDIN.getch                              
puts "            \r",""