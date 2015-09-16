ClassType = GraphQL::ObjectType.define do
  name "Class"
  field :name, types.String
  field :ancestors, -> { types[ClassType] }
end
