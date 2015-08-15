class ShasController < ApplicationController
  def show
    render text: `git rev-parse HEAD`
  end
end
