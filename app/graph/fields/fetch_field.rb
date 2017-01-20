module Fields
  class FetchField
    def self.build(model:, type:)
      return_type = type
      GraphQL::Field.define do
        type(return_type)
        description("Find a #{model.name} by ID")
        argument(:id, !types.Int, "ID for Record")
        resolve ->(obj, args, ctx) {
          model.find(args["id"])
        }
      end
    end
  end
end
