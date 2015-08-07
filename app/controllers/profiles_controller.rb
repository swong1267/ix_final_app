class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @spaces = @profile.user.spaces
    @events = @profile.user.events
    @avg_rating = 0.0
  end

  def new
    create
  end

  def create
    @profile = Profile.create! first_name: current_user.first_name, last_name: current_user.last_name, user: current_user
    @profile.save
    redirect_to profile_path(@profile)
  end

  def dashboard
    @profile = Profile.find(params[:id])
    @spaces = @profile.user.spaces
    @events = @profile.user.events
    @messages = Message.where(recipient: @profile.user).order("created_at DESC")
    @requests = @profile.user.space_requests
    @current_earnings = 0

    @unread = 0
    @messages.each do |message|
      if message.unread
        @unread += 1
      end
    end

    @past_events = []
    Event.all.each do |event|
      if (event.date < Time.zone.now) && (@spaces.include? event.space)
        @past_events << event
      end
    end

    @upcoming_events = []
    Event.all.each do |event|
      if (event.date > Time.zone.now) && (@spaces.include? event.space)
        @upcoming_events << event
      end
    end

    events = 0
    @most_popular_space = @spaces[0]
    @spaces.each do |space|
      if space.events.count > events
        events = space.events.count
        @most_popular_space = space
      end
    end
  end
end