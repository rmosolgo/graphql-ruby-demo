# interface Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
# }
CharacterInterface = GraphQL::InterfaceType.define do
  name "Character"
  description "A sentient actor in Star Wars"
  field :id,            !types.ID, "The unique ID of this person"
  field :name,          !types.String, "The name of this person"
  connection :friends,  -> { CharacterInterface.connection_type }, "Friends of this person"
  field :appearsIn,     types[EpisodeEnum], "Episodes this person appears in", property: :appears_in_names
end
