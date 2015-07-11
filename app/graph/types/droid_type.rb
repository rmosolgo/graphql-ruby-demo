# type Droid : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   primaryFunction: String
# }
DroidType = GraphQL::ObjectType.new do
  name "Droid"
  description "A robotic character in Star Wars"
  fields({
    id: field(type: !type.Int, desc: "The unique ID of this droid"),
    name: field(type: !type.String, desc: "The name of this droid"),
    friends: field(type: type[CharacterInterface], desc: "Friends of this droid"),
    appearsIn: field(type: type[EpisodeEnum], property: :appears_in_names, desc: "Episodes this droid appears in"),
    primaryFunction: field(type: type.String, property: :primary_function, desc: "What this droid is for"),
  })
  interfaces [CharacterInterface]
end
