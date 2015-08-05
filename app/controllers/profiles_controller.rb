class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @spaces = @profile.user.spaces
    @events = @profile.user.events
    # @past_events = Event.where(date < Time.zone.now) && event is in @events.. @events.include? ???
  end
end