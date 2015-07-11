# enum Episode { NEWHOPE, EMPIRE, JEDI }
EpisodeEnum = GraphQL::Enum.new do |e|
  e.name "Episode"
  e.description "An part of the Star Wars saga"
  e.value("NEWHOPE",  "Part 4")
  e.value("EMPIRE",   "Part 5")
  e.value("JEDI",     "Part 5")
end
