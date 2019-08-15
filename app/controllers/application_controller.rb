class ApplicationController < ActionController::Base

  before_action:set_current_user
  before_action:notice

  protect_from_forgery

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
    @user = User.find_by(id: session[:user_id])
    require "date"
<<<<<<< HEAD
    @now = DateTime.now

    if @user.present?
        if @user.time == nil
            @user.time = @now
            @user.save
        end

        @interval = (@user.time - @now) * -1
        if @interval > 60
=======

    if @user.present?
        @now = DateTime.now
        if @user.time.nil?
            @user.time = @now
        end

        @interval = (@user.time - @now) * -1
        if @interval > 3600
>>>>>>> refs/remotes/origin/master
            @user.time = @now
            @user.save
        end
    end

<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/master
  end

  def authenticate_user
      if @current_user == nil
          flash[:notice] = "ログインが必要です"
          redirect_to("/users/login")
      end
  end

  def login_user
      if @current_user
          @current_user = nil
      end
  end

  def detail_user
      @user_detail = UserDetail.find_by(user_id: @user.id)
      @bank = Bank.find_by(user_id: @user.id)
  end
<<<<<<< HEAD

=======
 
>>>>>>> refs/remotes/origin/master

  def flow_count
      @follows = Follow.where(receive: @current_user.id)
      @num_follow = @follows.count
  end
<<<<<<< HEAD


  def history_count
      @histories = History.where("(partner = ?) OR (user_id = ?)", session[:user_id], session[:user_id])
=======
  

  def history_count
      @histories = History.where(partner: session[:user_id])
>>>>>>> refs/remotes/origin/master
      @num = @histories.count
  end

  def evaluations_calculation
        @evaluations = Evaluation.where(user_id: session[:user_id])
        @number = @evaluations.count
        @storages = Storage.where(user_id: session[:user_id])
        @number2 = @storages.count

        if @number == 0
        else
          @user_evaluation = 0
          @evaluations.each do | evaluation |
<<<<<<< HEAD
            @user_evaluation +=  evaluation.overall
=======
            @user_evaluation = @user_evaluation + evaluation.overall
>>>>>>> refs/remotes/origin/master
          end
        end

        if @number2 == 0
        else
          @user_storage = 0
          @storages.each do | storage |
            @user_storage = @user_storage + storage.overall
          end
        end
        @user_evaluation = ((@user_storage.to_f + @user_evaluation.to_f) / (@number + @number2)).round(1)
   end
<<<<<<< HEAD

   def post_user
       @post = User.find_by(id: params[:id])
   end

=======
  
   def post_user
       @post = User.find_by(id: params[:id])
   end
   
>>>>>>> refs/remotes/origin/master
   def notice
       require "date"
       @day00 =  DateTime.now
       @daytime = DateTime.now
       @num = 0
       @count = 0
       @now = Time.new

       @requests = Request.where("waiting between '#{@day00.strftime("%Y-%m-%d %H:%M:%S")}' and '#{@day00.day} 23:59:59'").order('waiting asc')

       @requests2 = Request.where('waiting >= ?', @day00.day).order('waiting asc')
<<<<<<< HEAD
       @no_reads = Messeage.where(post_id: session[:user_id], read: 0).order('created_at DESC')
       @noread_bells = Bell.where(user_id: session[:user_id], read: 0).order('created_at DESC')
       #@noread_bells = Bell.where('user_id = ? and read = ?', session[:user_id],0).order('created_at DESC')
       #@no_reads = Messeage.where("post_id = ? and read = ?",  session[:user_id], 0).order('created_at DESC')

   end

=======
       @no_reads = Messeage.where("post_id = ? and read = ?",  session[:user_id], 0).order('created_at DESC')
       @noread_bells = Bell.where('user_id = ? and read = ?', session[:user_id],0).order('created_at DESC')
   end
   
>>>>>>> refs/remotes/origin/master
   def flow_count_pra
       @follows = Follow.where(receive: params[:id])
       @num_follow = @follows.count
   end
<<<<<<< HEAD

=======
   
>>>>>>> refs/remotes/origin/master
   def detail_user_pra
       @user_detail = UserDetail.find_by(user_id: params[:id])
       @bank = Bank.find_by(user_id: @user.id)
   end
<<<<<<< HEAD

   def history_count_partner
       @histories = History.where(user_id: params[:id])
       @num = @histories.count
   end

=======
   
   def history_count_partner
       @histories = History.where(partner: params[:id])
       @num = @histories.count
   end
   
>>>>>>> refs/remotes/origin/master
   def evaluations_calculation_para
       @evaluations = Evaluation.where(user_id: params[:id])
       @number = @evaluations.count
       @storages = Storage.where(user_id: params[:id])
       @number2 = @storages.count
<<<<<<< HEAD

=======
       
>>>>>>> refs/remotes/origin/master
       if @number == 0
           else
           @user_evaluation = 0
           @evaluations.each do | evaluation |
               @user_evaluation = @user_evaluation + evaluation.overall
           end
       end
<<<<<<< HEAD

=======
       
>>>>>>> refs/remotes/origin/master
       if @number2 == 0
           else
           @user_storage = 0
           @storages.each do | storage |
               @user_storage = @user_storage + storage.overall
           end
       end
       @user_evaluation = ((@user_storage.to_f + @user_evaluation.to_f) / (@number + @number2)).round(1)
   end



end
