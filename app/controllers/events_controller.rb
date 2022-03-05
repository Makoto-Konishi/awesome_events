class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'イベントを作成しました'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: '更新しまじた'
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy!
    redirect_to root_url, notice: '削除しました'
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :start_at, :end_at, :content)
  end
end
