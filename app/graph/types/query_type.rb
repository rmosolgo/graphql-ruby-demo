# type Query {
#   hero: Character
#   human(id: String!): Human
#   droid(id: String!): Droid
# }
QueryType = GraphQL::ObjectType.new do |t|
  t.name "Query"
  t.description "The query root for this schema"
  t.fields({
    # You can define fields on the fly:
    hero: GraphQL::Field.new { |f, types, field, arg|
      f.description("The hero of the saga")
      f.type(!CharacterInterface)
      f.arguments(episode: arg.build(
        type: EpisodeEnum,
        desc: "If provided, return the hero of that episode"
        )
      )
      f.resolve -> (o, a, c) {
        a["episode"] == 5 ? Human.find(1000) : Droid.find(2001)
      }
    },
    # Or use hand-rolled fields:
    human: FetchField.new(type: HumanType, model: Human),
    droid: FetchField.new(type: DroidType, model: Droid),
  })
end
