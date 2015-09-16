# enum Episode { NEWHOPE, EMPIRE, JEDI }
EpisodeEnum = GraphQL::EnumType.define do
  name "Episode"
  description "An part of the Star Wars saga"
  Character::EPISODES.each do |episode, name|
    value(name, "Part #{episode}", value: episode)
  end
end
