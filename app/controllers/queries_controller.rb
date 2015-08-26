class QueriesController < ApplicationController
  def new
  end

  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    query = GraphQL::Query.new(StarWarsSchema, query_string, variables: query_variables)
    render json: query.result
  end
end
