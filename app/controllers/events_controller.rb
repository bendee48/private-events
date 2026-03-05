class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :show ]
  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(current_user.id)
    @event = @user.created_events.build(event_params)

    if @event.save
      # add the creator as the first guest
      @event.attendances.create!(user_id: @user.id, status: "going")
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @guests = @event.guests
    @users = User.all
  end

  private

  def event_params
    params.expect(event: [ :title, :date, :location ])
  end
end
