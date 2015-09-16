class QueriesController < ApplicationController
  def new
  end

  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    result = StarWarsSchema.execute(query_string, variables: query_variables)
    render json: result
  end
end
