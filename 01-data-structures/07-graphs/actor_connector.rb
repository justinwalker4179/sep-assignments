require_relative 'node'

def main(actor1, actor2)
  connections_limit = 6
  @movie_list = []
  @actor_list = [actor1.name]
  @checked_movies = [nil]

  if connectTwoActors(actor1, actor2, connections_limit)
    display_connections(@movie_list, @actor_list)
  else
    puts "Connection between #{actor1.name} and #{actor2.name} could not be made."
  end
end

# Takes an actor node and finds the names of all movies in its hash. Returns array of movie names.
# Option to limit movies to a limited number.
def findTopMovies(actor, top_number=100)  
  movie_array = []

  actor.film_actor_hash.each_key {|key| movie_array.push(key)}

  return movie_array.take(top_number)
end

# Iterates through every actor in every movie and tries to connect two actors.
# Remaining_nodes limits number of connections to prevent endless loop.
# Returns true if the connection was successfully made.
def connectTwoActors(start_actor, target_actor, remaining_nodes)
  if remaining_nodes <= 0
    return nil
  end
  movies = findTopMovies(start_actor)
  actor_found = false
  for movie in movies
    if isNewMovie?(movie, @checked_movies)
      for actor in start_actor.film_actor_hash[movie]
        if actor.is_a? Node
          if actor == target_actor || connectTwoActors(actor,target_actor, remaining_nodes-1) == target_actor
            @movie_list.insert(0,movie)
            @actor_list.insert(1,actor.name)
            actor_found = true
            return target_actor
          end
        end
      end
    end
  end
  return actor_found
end

# Checks movie to see if it has already been searched. If it hasn't it is added to list of checked movies
# and returns true. If movie has already been checked it returns false.
def isNewMovie?(film, movie_list)
  for item in movie_list
    if item == film
      return false
    end
  end
  movie_list.push(film)
  return true
end

# Displays the connections between with each actor in each movie.
def display_connections(movie_list, actor_list)
  index = 0
  for movie in movie_list
    puts "#{actor_list[index]} and #{actor_list[index+=1]} in #{movie}."
  end
end

kevin_bacon = Node.new("KevinBacon")
demi_moore = Node.new("DemiMoore")
burt_reynolds = Node.new("BurtReynolds")
jon_voight = Node.new("JonVoight")
will_smith = Node.new("WillSmith")

kevin_bacon.film_actor_hash["Footloose"] = ["LoriSinger","JohnLithgow","DianneWest","ChristPenn","SarahJessicaParker"]
kevin_bacon.film_actor_hash["Tremors"] = ["FredWard","FinnCarter","MichaelGross","RebaMcEntire","RobertJayne"]
kevin_bacon.film_actor_hash["A Few Good Men"] = ["TomCruise","JackNicholson",demi_moore,"KieferSutherland","KevinPollak"]
kevin_bacon.film_actor_hash["Sleepers"] = ["BillyCrudup","RobertDeNiro","RonEldard","MinnieDriver","DustinHoffman"]

demi_moore.film_actor_hash["A Few Good Men"] = ["TomCruise","JackNicholson",kevin_bacon,"KieferSutherland","KevinPollak"]
demi_moore.film_actor_hash["Striptease"] = [burt_reynolds,"ArmandAssante","VingRhames","RobertPatrick","PaulGuilfoyle"]
demi_moore.film_actor_hash["G.I. Jane"] = ["ViggoMortensen","AnneBancroft","JasonBeghe","DanielVonBargen","JohnMichaelHiggings"]
demi_moore.film_actor_hash["Indecent Proposal"] = ["RobertRedford","WoodyHarrelson","OliverPlatt","BillyBobThorton","SeymourCassel"]

burt_reynolds.film_actor_hash["Deliverance"] = [jon_voight,"NedBeatty","RonnyCox","EdRamey","BillyRedden"]
burt_reynolds.film_actor_hash["Striptease"] = [demi_moore,"ArmandAssante","VingRhames","RobertPatrick","PaulGuilfoyle"] 
burt_reynolds.film_actor_hash["Smokey And The Bandit"] = ["SallyField","JerryReed","MikeHenry","PaulWilliams","PatMcCormick"] 
burt_reynolds.film_actor_hash["Boogie Nights"] = ["LuizGuzman","JulianneMoore","RicoBueno","JohnCReilly","NicoleAriParker"] 

jon_voight.film_actor_hash["Deliverance"] = [burt_reynolds,"NedBeatty","RonnyCox","EdRamey","BillyRedden"]
jon_voight.film_actor_hash["Anaconda"] = ["JenniferLopez","IceCube","EricStoltz","JonathanHyde","OwenWilson"]
jon_voight.film_actor_hash["Transformers"] = ["ShiaLeBeouf","MeganFox","JoshDuhamel","TyreseGibson","JohnTurturro"]
jon_voight.film_actor_hash["Enemy of the State"] = ["GeneHackman","LisaBonet","ReginaKing","StuartWilson",will_smith]

will_smith.film_actor_hash["Men In Black"] = ["TommyLeeJones","LindaFiorento","VincentD'Onofrio","RipTorn","TonyShalhoub"]
will_smith.film_actor_hash["Independence Day"] = ["BIllPullman","JeffGoldblum","MaryMcDonnell","JuddHirsch","RobertLoggia"]
will_smith.film_actor_hash["Enemy of the State"] = ["GeneHackman","LisaBonet",jon_voight,"ReginaKing","StuartWilson"]
will_smith.film_actor_hash["Ali"] = ["JamieFoxx",jon_voight,"MarioVanPeebles","RonSilver","JeffreyWright"]

main(kevin_bacon, will_smith)