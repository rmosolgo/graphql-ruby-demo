class FetchField
  # name will be assigned when this field is
  # attached to something
  attr_accessor :name
  attr_reader :type, :description, :arguments, :deprecation_reason

  def initialize(model:, type:)
    @model = model
    @type = type
    @description = "Find a #{@model.name} by ID"
    @arguments = {id: {type: !GraphQL::INT_TYPE} }
    @deprecation_reason = nil
  end

  # Called during query execution
  def resolve(object, arguments, context)
    @model.find(arguments["id"])
  end

  def deprecated?
    !!deprecation_reason
  end
end
