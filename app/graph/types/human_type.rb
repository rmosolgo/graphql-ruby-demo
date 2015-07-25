# type Human : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   homePlanet: String
# }
HumanType = GraphQL::ObjectType.new do |t, types, field|
  t.name "Human"
  t.description "A flesh-and-blood character in Star Wars"
  t.fields({
    id:         field.build(type: !types.Int, desc: "The unique ID of this person"),
    name:       field.build(type: !types.String, desc: "The name of this person"),
    friends:    field.build(type: types[CharacterInterface], desc: "Friends of this person"),
    appearsIn:  field.build(type: types[EpisodeEnum], desc: "Episodes this person appears in"),
    homePlanet: field.build(type: types.String, property: :home_planet, desc: "Where this person is from"),
  })
  t.interfaces [CharacterInterface]
end
