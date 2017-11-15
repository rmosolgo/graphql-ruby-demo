# enum Episode { NEWHOPE, EMPIRE, JEDI }
module Types
  class EpisodeEnum < BaseEnum
    graphql_name "Episode"
    description "An part of the Star Wars saga"
    Character::EPISODES.each do |episode, name|
      value(name, "Part #{episode}", value: episode)
    end
  end
end
