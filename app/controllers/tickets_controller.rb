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
end
