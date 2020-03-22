class ApiController < ApplicationController
  def about
    render json: {name: 'Api server for counting statistic games in matches'}
  end
end
