class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(current_user.id)
    @event = @user.created_events.build(event_params)

    if @event.save
      @event.attendances.create!(user_id: @user.id)
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.expect(event: [ :title, :date, :location ])
  end
end
