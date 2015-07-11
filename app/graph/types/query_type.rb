# type Query {
#   hero: Character
#   human(id: String!): Human
#   droid(id: String!): Droid
# }
QueryType = GraphQL::ObjectType.new do
  name "Query"
  description "The query root for this schema"
  fields({
    # You can define fields on the fly:
    hero: GraphQL::Field.new { |f|
      f.description("The hero of the saga")
      f.type(!CharacterInterface)
      f.resolve -> (o, a, c) { Droid.find(2001) }
    },
    # Or use hand-rolled fields:
    human: FetchField.new(type: HumanType, model: Human),
    droid: FetchField.new(type: DroidType, model: Droid),
  })
end
