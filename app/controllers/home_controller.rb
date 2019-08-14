class HomeController < ApplicationController
    before_action :notice,{only: [:index]}
  def index
    require "date"
    @day =  DateTime.now
    @daytime = DateTime.now
    @num = 0
    @count = 0
    @now = Time.new

    @requests = Request.where(waiting: @day...@day.end_of_day, status: 0).order('waiting asc')
    @requests2 = Request.where("waiting > ?", @day).order('waiting asc')



  end

  def guide
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
    flash[:notice] = "ログアウトしました"

  end

end
