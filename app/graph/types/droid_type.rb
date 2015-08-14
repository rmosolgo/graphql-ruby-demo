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
  interfaces [CharacterInterface]

  field :id, !types.Int, "The unique ID of this droid"
  field :name, !types.String, "The name of this droid"
  field :friends, types[CharacterInterface], "Friends of this droid"
  field :appearsIn, types[EpisodeEnum], "Episodes this droid appears in"
  field :primaryFunction,  types.String, "What this droid is for", property: :primary_function
end
