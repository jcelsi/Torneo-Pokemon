def get_pokemon_data(id)
    # Request the pokemon data from the api when given an id (pokedex number)
    uri = URI("https://pokeapi.co/api/v2/pokemon/#{id}/")
    res = Net::HTTP.get_response(uri)
    res_json = JSON.parse(res.body)
    return res_json
end

def fixture_node(data,spaces = "")
    # Recursive function for printing fixture nodes given a multidimensional array
    if data.kind_of?(Array)
        fixture_node(data[0],spaces+" "*5)
        puts spaces+"----|"
        fixture_node(data[1],spaces+" "*5)
    else
        puts spaces+"---- "+data.name
    end
end

def reshape_array(array)
    # Auxiliary function for transforming a one dimensional array to a 'paired' multidimensional array
    # Used for the input of fixture_node
    while array.length()!=2
        array = array.each_slice(2).to_a
    end
    return array
end