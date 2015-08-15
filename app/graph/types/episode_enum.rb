# enum Episode { NEWHOPE, EMPIRE, JEDI }
EpisodeEnum = GraphQL::EnumType.define do
  name "Episode"
  description "An part of the Star Wars saga"
  value("NEWHOPE",  "Part 4", value: 4)
  value("EMPIRE",   "Part 5", value: 5)
  value("JEDI",     "Part 6", value: 6)
end
