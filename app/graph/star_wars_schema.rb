class StarWarsSchema < GraphQL::Schema
  query Types::QueryType

  def self.resolve_type(type, obj, ctx)
    case obj
    when Droid
      Types::DroidType
    when Human
      Types::HumanType
    else
      raise("Don't know how to get the GraphQL type of a #{obj.class.name} (#{obj.inspect})")
    end
  end

  def self.object_from_id(id, ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)

    # This `find` gives the user unrestricted access to *all* the records in your app. In
    # a real world application you probably want to check if the user is allowed to access
    # the requested resource.
    type_name.constantize.find(item_id)
  end

  def self.id_from_object(object, type_definition, ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end
end
