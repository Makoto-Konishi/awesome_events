class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?, :current_user

  private
  def logged_in?
    !!current_user
  end

  def current_user
    # returnの返す値を省略するとnilになる, ログインしていない場合にはnilを返したいのでreturnの返す値を省略している。
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate
    return false if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end
end
