# type Human : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   homePlanet: String
# }
HumanType = GraphQL::ObjectType.new do
  name "Human"
  description "A flesh-and-blood character in Star Wars"
  fields({
    id:         field(type: !type.Int, desc: "The unique ID of this person"),
    name:       field(type: !type.String, desc: "The name of this person"),
    friends:    field(type: type[CharacterInterface], desc: "Friends of this person"),
    appearsIn:  field(type: type[EpisodeEnum], property: :appears_in_names, desc: "Episodes this person appears in"),
    homePlanet: field(type: type.String, property: :home_planet, desc: "Where this person is from"),
  })
  interfaces [CharacterInterface]
end
