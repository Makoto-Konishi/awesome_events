class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @event_search_form = EventSearchForm.new(event_search_form_params)
    @events = @event_search_form.search
  end

  private

  def event_search_form_params
    # fetch 指定されたキーのパラメータを参照,
    # つまり,キーが存在しないときは第二引数をdefaultとして返すという指定なので、対象に対してデフォルト値を設定し、エラーを出したくない場合に使う
    # merge ユーザから受け取ったparamsにはないけれども、レコード作成時に追加したい値がある場合はmergeメソッドで含める
    params.fetch(:event_search_form, {}).permit(:keyword, :start_at).merge(page: params[:page])
  end
end
