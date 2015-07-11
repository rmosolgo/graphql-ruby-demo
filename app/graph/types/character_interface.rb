# interface Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
# }
CharacterInterface = GraphQL::Interface.new do
  name "Character"
  description "A sentient actor in Star Wars"
  fields({
    id:         field(type: !type.Int, desc: "The unique ID of this person"),
    name:       field(type: !type.String, desc: "The name of this person"),
    friends:    field(type: type[self], desc: "Friends of this person"),
    appearsIn:  field(type: type[EpisodeEnum], property: :appears_in_names, desc: "Episodes this person appears in"),
  })
end
