require_relative 'node'

def main(actor1, actor2)
  connections_array = Array.new(6)
  movie_list = []
  actor_list = []

  connectToActor(actor1, actor2, 6)

  puts movie_list
end

# Takes an actor node and finds the names of all actors in all movies in its hash. Returns array of actor nodes.
def findTopActors(actor)
  actor_movies = findTopMovies(actor)
  actor_array = []
  for item in actor_movies
    actor_array += actor.film_actor_hash[item]
  end

  return actor_array
end

# Takes an actor node and finds the names of all movies in its hash. Returns array of movie names.
# Option to limit movies to a limited number.
def findTopMovies(actor, top_number=100)  
  movie_array = []

  actor.film_actor_hash.each_key {|key| movie_array.push(key)}

  return movie_array.take(top_number)
end

def connectToActor(start_actor, target_actor, remaining_nodes)
  if remaining_nodes <= 0
    return nil
  end
  movies = findTopMovies(start_actor)

  for movie in movies
    for actor in start_actor.film_actor_hash[movie]
      if actor.is_a? Node
        if actor == target_actor || connectToActor(actor,target_actor, remaining_nodes-1) == target_actor
          movie_list.push(movie)
          actor_list.push(actor)

          return target_actor
        end
      end
    end
  end

  return nil
end


kevin_bacon = Node.new()
demi_moore = Node.new()
burt_reynolds = Node.new()
jon_voight = Node.new()
will_smith = Node.new()

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