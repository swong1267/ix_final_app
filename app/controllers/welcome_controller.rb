class WelcomeController < ApplicationController
  def index
    @events = Event.where(public: true)
  	@spaces = Space.all
  	@users = User.all
  end
end
