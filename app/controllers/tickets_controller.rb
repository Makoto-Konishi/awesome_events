class TicketsController < ApplicationController
  def new
    # ログインしているユーザが直接urlにevents/:id/tickets/newと入力した場合に例外を発生させる
    raise ActionController::RoutingError, 'ログイン状態で TicketsController#new にアクセス'
  end

  def create
    event = Event.find(params[:event_id])
    @ticket = current_user.tickets.build(event: event, comment: params[:ticket][:comment])
    if @ticket.save
      redirect_to event, notice: 'このイベントに参加表明しました'
    end
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[:event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: 'このイベントの参加をキャンセルしました'
  end
end
