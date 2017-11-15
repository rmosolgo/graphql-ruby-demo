# interface Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
# }
module Types
  CharacterInterface = GraphQL::InterfaceType.define do
    name "Character"
    description "A sentient actor in Star Wars"
    field :id,            ID, "The unique ID of this person", null: true
    field :name,          String, "The name of this person", null: true
    field :friends, CharacterInterface.connection_type, "Friends of this person", connection: true
    field :appearsIn,     [EpisodeEnum], "Episodes this person appears in", property: :appears_in_names
  end
end
