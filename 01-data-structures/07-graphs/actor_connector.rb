require_relative 'node'

def actor_connector(first_actor, second_actor)

end

def findTopMovies(actor_film_hash, top_number=10)  
  movie_array = []

  actor_film_hash.each_key {|key| movie_array.push(key)}

  return movie_array
end


kevin_bacon = Node.new()
kevin_bacon.film_actor_hash["Footloose"] = ["LoriSinger","JohnLithgow","DianneWest","ChristPenn","SarahJessicaParker"]
kevin_bacon.film_actor_hash["Tremors"] = ["FredWard","FinnCarter","MichaelGross","RebaMcEntire","RobertJayne"]
puts findTopMovies(kevin_bacon.film_actor_hash)