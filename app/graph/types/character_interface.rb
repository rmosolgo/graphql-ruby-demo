# interface Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
# }
CharacterInterface = GraphQL::Interface.new do |i, type, field|
  i.name "Character"
  i.description "A sentient actor in Star Wars"
  i.fields({
    id:         field.build(type: !type.Int, desc: "The unique ID of this person"),
    name:       field.build(type: !type.String, desc: "The name of this person"),
    friends:    field.build(type: type[i], desc: "Friends of this person"),
    appearsIn:  field.build(type: type[EpisodeEnum], property: :appears_in_names, desc: "Episodes this person appears in"),
  })
end
