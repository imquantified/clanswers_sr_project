class ActivitiesController < ApplicationController

  def index
  	@actvities = PublicActivity::Activity.all
  end
end
