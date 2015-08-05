class WelcomeController < ApplicationController

def index
	@events = Event.all
	@spaces = Space.all
	@users = User.all
end

end