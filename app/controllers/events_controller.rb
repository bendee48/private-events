class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_event, only: [ :show, :edit, :update ]
  before_action :authorize_creator!, only: [ :edit, :update ]
  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      # add the creator as the first guest
      @event.attendances.create!(user_id: current_user.id, status: "going")
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @attendees = @event.attendees
    @users = User.all
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated!"
    else
      flash.now[:alert] = "Unable to update event. Please fix the errors below."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: [ :title, :date, :location ])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_creator!
    redirect_to events_path, alert: "Not authorized for that action" unless @event.created_by?(current_user)
  end
end
