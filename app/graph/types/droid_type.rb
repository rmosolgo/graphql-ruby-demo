# type Droid : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   primaryFunction: String
# }
DroidType = GraphQL::ObjectType.new do |t, type, field|
  t.name "Droid"
  t.description "A robotic character in Star Wars"
  t.fields({
    id:               field.build(type: !type.Int, desc: "The unique ID of this droid"),
    name:             field.build(type: !type.String, desc: "The name of this droid"),
    friends:          field.build(type: type[CharacterInterface], desc: "Friends of this droid"),
    appearsIn:        field.build(type: type[EpisodeEnum], desc: "Episodes this droid appears in"),
    primaryFunction:  field.build(type: type.String, property: :primary_function, desc: "What this droid is for"),
  })
  t.interfaces [CharacterInterface]
end
