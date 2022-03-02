class EventsController < ApplicationController
  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build

    if @event.save
      redirect_to @event, notice: 'イベントを作成しました'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_at, :end_at)
  end
end
