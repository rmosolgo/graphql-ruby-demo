# type Human : Character {
#   id: String!
#   name: String
#   friends: [Character]
#   appearsIn: [Episode]
#   homePlanet: String
# }
module Types
  class HumanType < BaseObject
    description "A flesh-and-blood character in Star Wars"
    interfaces [GraphQL::Relay::Node.interface, CharacterInterface]

    global_id_field :id
    field :name, String, "The name of this person", null: true
    field :friends, CharacterInterface.connection_type, "Friends of this person", connection: true
    field :appearsIn, [EpisodeEnum], "Episodes this person appears in", property: :appears_in
    field :homePlanet, String, "Where this person is from", property: :home_planet
  end
end
