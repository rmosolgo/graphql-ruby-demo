# type Droid : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   primaryFunction: String
# }
DroidType = GraphQL::ObjectType.define do
  name "Droid"
  description "A robotic character in Star Wars"
  interfaces [GraphQL::Relay::Node.interface, CharacterInterface]

  global_id_field :id
  field :name, !types.String, "The name of this droid"
  connection :friends, CharacterInterface.connection_type, "Friends of this droid"
  field :appearsIn, types[EpisodeEnum], "Episodes this droid appears in", property: :appears_in
  field :primaryFunction,  types.String, "What this droid is for", property: :primary_function
end
