class RecommendationsController < ApplicationController

  def connections
    @connections = current_user.connections
  end

  def recommendations
    @recommendations = current_user.active_recommendations
  end

  def resolve_recommendation
    # TODO: accept/deny post goes here
  end

end
