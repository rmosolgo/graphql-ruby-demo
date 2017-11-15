# type Droid : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   primaryFunction: String
# }
module Types
  class DroidType < BaseObject
    description "A robotic character in Star Wars"
    interfaces [GraphQL::Relay::Node.interface, CharacterInterface]

    global_id_field :id
    field :name, String, "The name of this droid", null: true
    field :friends, CharacterInterface.connection_type, "Friends of this droid", connection: true
    field :appearsIn, [EpisodeEnum], "Episodes this droid appears in", property: :appears_in
    field :primaryFunction,  String, "What this droid is for", property: :primary_function
  end
end
