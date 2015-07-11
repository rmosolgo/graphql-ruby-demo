class QueriesController < ApplicationController
  def new
  end

  def create
    query_string = params[:query]
    query_params = params[:params] || {}
    query = GraphQL::Query.new(StarWarsSchema, query_string, params: params)
    render json: query.result
  end
end
