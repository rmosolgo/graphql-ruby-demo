# type Human : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   homePlanet: String
# }
HumanType = GraphQL::ObjectType.define do
  name "Human"
  description "A flesh-and-blood character in Star Wars"
  interfaces [CharacterInterface]

  field :id, !types.Int, "The unique ID of this person"
  field :name, !types.String, "The name of this person"
  field :friends, types[CharacterInterface], "Friends of this person"
  field :appearsIn, types[EpisodeEnum], "Episodes this person appears in"
  field :homePlanet, types.String, "Where this person is from", property: :home_planet
end
