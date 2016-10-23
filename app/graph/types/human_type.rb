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
  interfaces [GraphQL::Relay::Node.interface, CharacterInterface]

  global_id_field :id
  field :name, !types.String, "The name of this person"
  connection :friends, CharacterInterface.connection_type, "Friends of this person"
  field :appearsIn, types[EpisodeEnum], "Episodes this person appears in", property: :appears_in
  field :homePlanet, types.String, "Where this person is from", property: :home_planet
end
