class UsersController < ApplicationController
 before_action :authenticate_user, {only: [:dog_edit, :writing, :talk, :show, :mydog, :rely, :evaluation, :history, :edit, :seen, :news, :check, :update_re, :show_follow,  :direct_message, :impression, :storage, :seen_evaluation]}
 before_action :login_user,{only: [:new, :login]}
 before_action :detail_user,{only: [:news, :talk, :show, :evaluation, :history, :direct_message]}
 before_action :flow_count,{only: [:news, :talk, :show, :evaluation, :history, :direct_message]}
<<<<<<< HEAD
 before_action :history_count,{only: [:talk, :news, :direct_message, :evaluation, :history, :show, :seen_evaluation, :seen, :show_follow]}
 before_action :evaluations_calculation,{only: [:news, :direct_message, :talk, :evaluation, :history, :show]}
 before_action :post_user,{only: [:direct_message, :message_create, :talk]}
=======
 before_action :history_count,{only: [:talk, :news, :direct_message, :evaluation, :history, :show]}
 before_action :evaluations_calculation,{only: [:news, :direct_message, :talk, :evaluation, :history, :show]}
 before_action :post_user,{only: [:direct_message, :message_create, :talk]}
 before_action :history_count_partner,{only: [:seen_evaluation, :seen, :show_follow]}
>>>>>>> refs/remotes/origin/master
 before_action :flow_count_pra,{only: [:seen_evaluation, :seen, :show_follow]}
 before_action :detail_user_pra,{only: [:seen_evaluation, :seen, :show_follow]}
 before_action :evaluations_calculation_para,{only: [:seen_evaluation, :seen, :show_follow]}

<<<<<<< HEAD
 def eva_detail

 end

=======
>>>>>>> refs/remotes/origin/master
 def dog_edit
   @dog = Dog.find_by(id: params[:id])
   @user = User.find_by(id: @current_user.id)
 end

 def dogUpdate
   @dog = Dog.find_by(id: params[:id])
   @user = User.find_by(id: @dog.user_id)

     if params[:image].nil?
     else
<<<<<<< HEAD
       @dog.image_name = "#{@dog.id}.jpg"
       image = params[:image]
       @dog.save

       File.binwrite("/Users/shinkaihideto/Desktop/remote/current/public/dog_images/#{@dog.image_name}", image.read)
=======
       @dog.image_name = "#{@dog.id}1.jpg"
       image = params[:image]
       @dog.save

       File.binwrite("/Users/shinkaihideto/desktop/secondhouse_test0703/public/dog_images/#{@dog.image_name}", image.read)
>>>>>>> refs/remotes/origin/master
       flash[:notice] = "プロフィールを更新しました"
     end

     if params[:name].empty?
       else
       @dog.name = params[:name]
       @dog.save
       flash[:notice] = "プロフィールを更新しました"
     end

     if params[:introduction].empty?
     else
       @info = Information.find_by(dog_id: @dog.id)
       if @info
         @info.introduction = params[:introduction]
         @info.save
         flash[:notice] = "プロフィールを更新しました"
       else
         @info = Information.new(user_id: session[:user_id],
                                     dog_id: params[:id],
                                     introduction: params[:introduction]
                                     )
         @info.save
       end
     end

     if params[:sex].nil?
     else
       @dog.sex = params[:sex]
       @dog.save
       flash[:notice] = "プロフィールを更新しました"
     end

     if params[:year].present? && params[:month].present? && params[:day].present?
       @dog.birthday = params[:year] + "/" +  params[:month] + "/" + params[:day]
       @dog.save
       flash[:notice] = "プロフィールを更新しました"
     end

     if params[:dog_breed].empty?
     else
       @dog.dog_breed = params[:dog_breed]
       @dog.save
       flash[:notice] = "プロフィールを更新しました"
     end

     if params[:weight].empty?
     else
       @dog.weight = params[:weight]
       @dog.save
       flash[:notice] = "プロフィールを更新しました"
     end

     if params[:castration].nil?
     else
       @dog.castration = params[:castration]
       @dog.save
       flash[:notice] = "プロフィールを更新しました"
     end


     if params[:rabies].nil?
     else
       @dog.rabies = params[:rabies]
       @dog.save
       flash[:notice] = "プロフィールを更新しました"
     end

<<<<<<< HEAD
    params[:character].each do | di1,di2 |
        if di2 == "1"
            @dog.character = nil
        end
    end

     params[:character].each do | di1,di2 |
         if di2 == "1"
             if @dog.character == nil
                 @dog.character = "#{di1}"
             else
                 @dog.character = "#{@dog.character}" + "," + "#{di1}"
             end
        flash[:notice] = "プロフィールを更新しました"
        end
    end
    @dog.save
=======


   params[:character].each do | di1,di2 |
       if di2 == "1"
           @dog.character = nil
           if @dog.character == nil
               @dog.character = "#{di1}"
           else
               @dog.character = "#{@dog.character}" + "," + "#{di1}"
           end
       flash[:notice] = "プロフィールを更新しました"
       end
   end
   @dog.save
>>>>>>> refs/remotes/origin/master


   redirect_to("/users/dog_edit/#{@dog.id}")

end

    #ajax--------------
    def check_test
        ajax_action unless params[:ajax_handler].blank?
    end

    def check_user
        @existence = User.find_by(name: params[:name])
        if @existence.present?
            @existence = "使用できません"
        else
            @existence = "使用できます"
        end
        #@data = User.where 'name like ?', '%' + params[:name] + '%'
        @existence = @existence.to_json.html_safe
    end

    #cropperテスト------------
    def cropper
        @user = User.find(params[:id])
    end

    def testCropper
        @user = User.find(params[:id])
    end
    #ここまでcropperテスト-------------

  def index
    flash[:notice] = nil
  end

  def news
      @bells = Bell.where(user_id: @user.id)
      @bells = @bells.order("created_at DESC")
      @now = Time.new
   #お知らせの未読解除
<<<<<<< HEAD
      @noread_bells = Bell.where(user_id: session[:user_id], read: 0)
=======
      @noread_bells = Bell.where('user_id = ? and read = ?', session[:user_id],0)
>>>>>>> refs/remotes/origin/master
      @noread_bells.each do | noread_bell |
          noread_bell.read = 1
          noread_bell.save
      end

  end
#==========トークルーム（送信）=================
  def direct_message
#ログイン情報--------------
    require "date"
      @now = DateTime.now
      @login = (@post.time - @now) * -1



#送信相手の情報-------------------------------------------------
      @messeages = Messeage.where("post_id = ? and send_id = ?", @user.id , @post.id)
      @messeages += Messeage.where("post_id = ? and send_id = ?",  @post.id , @user.id)
      @messeages = @messeages.sort
<<<<<<< HEAD

      @no_reads = Messeage.where(post_id: @user.id, read: 0)
      @no_reads.each do | no_read |
          no_read.read = 1
          no_read.save
      end
=======
>>>>>>> refs/remotes/origin/master
  end

  #メッセージ送信後の処理-----------------------------
  def message_create
        @messeage = Messeage.new(send_id: @user.id, post_id: @post.id, messe:params[:messe], read: 0)
        @messeage.save

        flash[:notice] = "ダイレクトメッセージを送信しました"
        redirect_to("/users/seen/direct_message/#{@post.id}")
  end

#==========トークルーム（受信）=================
  def talk
      @messeages = Messeage.where(post_id: @user.id).order(id: "desc")
      @now = Time.new

      #既読にする--------------
<<<<<<< HEAD
      @no_reads = Messeage.where(post_id: @user.id, read: 0)
=======
      @no_reads = Messeage.where("post_id = ? and read = ?",  @user.id, 0)
>>>>>>> refs/remotes/origin/master
      @no_reads.each do | no_read |
          no_read.read = 1
          no_read.save
      end

  end

#==========預かり依頼削除=================
  def destroy_re
    @request = Request.find_by(id: params[:id])
    @request.delete
    flash[:notice] = "預かり依頼を削除しました"
    redirect_to("/users/rely/#{@user.id}")

  end

#=================預かり依頼確認=============
  def rely
    @today =  Date.today
    @requests = Request.where("user_id = ? and status = ?", session[:user_id], 0)
    @requests += Request.where("user_id = ? and status = ?", session[:user_id], 1)
    @requests += Request.where("user_id = ? and status = ?", session[:user_id], 2)
    @requests += Request.where("user_id = ? and status = ?", session[:user_id], 3)
    @entries = Entry.where(entry_id: @user.id)

  end
#=================預かり依頼編集===========================================================
  def edit_re
    @request = Request.find_by(id: params[:id])
    #--------ラジオボタンの項目----------

    @request.adress = params[:addr11]

    params[:walk].each do | di1,di2 |
      @request.walk = "#{di2}"
    end
    params[:walk_time].each do | di1,di2 |
      @request.walk_time = "#{di2}"
    end
    params[:bait].each do | di1,di2 |
      @request.bait = "#{di2}"
    end
    params[:snack].each do | di1,di2 |
      @request.snack = "#{di2}"
    end
    params[:toilet].each do | di1,di2 |
        @request.toilet = "#{di2}"
    end
    params[:caretaker].each do | di1,di2 |
      @request.caretaker = "#{di2}"
    end
    params[:child].each do | di1,di2 |
      @request.child = "#{di2}"
    end
    params[:native].each do | di1,di2 |
      @request.native = "#{di2}"
    end
    params[:animal].each do | di1,di2 |
      @request.animal = "#{di2}"
    end
    #--------チェックボタンの項目------------------
  @request.dog_id = nil
  @request.dog_id2 = nil
  @request.dog_id3 = nil

  params[:dog_choice].each do | di1,di2 |
        if di2 == "1"
            if @request.dog_id == nil
                @request.dog_id = "#{di1}"
            elsif @request.dog_id != nil
                @request.dog_id2 = "#{di1}"
            elsif @request.dog_id2 != nil
                @request.dog_id3 = "#{di1}"
            end
        end
  end

    @request.save
    #------------待ち合わせ日付登録------------------
        @today =  Date.today

        params[:month].each do | di1,di2 |
          @month = "#{di2}".to_i
        end
        params[:day].each do | di1,di2 |
          @day = "#{di2}".to_i
        end
        params[:hour].each do | di1,di2 |
          @hour = "#{di2}".to_i
        end
        params[:min].each do | di1,di2 |
          @min = "#{di2}".to_i
        end

        require "date"
        @request.waiting = DateTime.new(@today.year, @month, @day, @hour, @min, 45, 0.375)


    #------------お迎え日付登録------------------
      params[:month11].each do | di1,di2 |
        @month11 = "#{di2}".to_i
      end
      params[:day12].each do | di1,di2 |
        @day12 = "#{di2}".to_i
      end
      params[:hour11].each do | di1,di2 |
        @hour11 = "#{di2}".to_i
      end
      params[:min11].each do | di1,di2 |
        @min11 = "#{di2}".to_i
      end

      require "date"
      @request.end = DateTime.new(@today.year, @month11, @day12, @hour11, @min11, 45, 0.375)

      #------------コメントok------------------
      params[:comment_ok].each do | di1,di2 |
        @request.comment_ok = "#{di2}"
      end
      #------------コメントng------------------
      params[:comment_ng].each do | di1,di2 |
        @request.comment_ng = "#{di2}"
      end



      #------------breedモデル作成（犬種検索用）---------------------

      if @request.dog_id
        @breed1 = Dog.find_by(id: @request.dog_id)
      end

      if @request.dog_id2
        @breed2 = Dog.find_by(id: @request.dog_id2)
      end

      if @request.dog_id3
        @breed3 = Dog.find_by(id: @request.dog_id3)
      end

      @breed = Breed.find_by(request_id: @request.id)


      if @breed1
        @breed.breed1 = @breed1.dog_breed
      end
      if @breed2
        @breed.breed2 = @breed2.dog_breed
      end
      if @breed3
        @breed.breed3 = @breed3.dog_breed
      end

      @breed.save
      #------------breedモデル作成（犬種検索用）---------------------

      @breed.address = @request.adress
      @breed.save
      @request.save

      if @request.waiting < @today
        flash[:notice] = "待ち合わせ時間が過ぎています"
        redirect_to("/users/update_re/#{@request.id}") and return
      elsif @request.end < @request.waiting
        flash[:notice] = "お迎え時間が正しくありません。"
        redirect_to("/users/update_re/#{@request.id}") and return
      else
        flash[:notice] = "預かり依頼を作成しました"
        redirect_to("/users/check/#{@request.id}") and return
      end

      redirect_to("/users/check/#{@request.id}") and return


  end

#===================================預かり依頼編集ページ===================================
  def update_re
    @request = Request.find_by(id: params[:id])
    @dogs = Dog.where(user_id: session[:user_id])
    @day = @request.waiting
    @day11 = @request.end
#----------ラジオボタンの初期値-------------------------------
#---------散歩--------------------------
    @hoge1 = false
    @hoge2 = false
    @hoge3 = false
    @hoge4 = false
    if @request.walk == "なし"
      @hoge1 = true
    elsif @request.walk == "1回"
      @hoge2 = true
    elsif @request.walk == "2回"
      @hoge3 = true
    elsif @request.walk == "3回"
      @hoge4 = true
    end
#---------散歩時間--------------------------
    @hoge11 = false
    @hoge12 = false
    @hoge13 = false
    @hoge14 = false
    if @request.walk_time == "15分程"
      @hoge11 = true
    elsif @request.walk_time == "30分程"
      @hoge12 = true
    elsif @request.walk_time == "1時間程"
      @hoge13 = true
    elsif @request.walk_time == "1時間以上"
      @hoge14 = true
    end
#---------エサ-------------------------------
    @hoge21 = false
    @hoge22 = false

    if @request.bait == "2回"
      @hoge21 = true
    else
      @hoge22 = true
    end

#---------おやつ-------------------------------
        @hoge31 = false
        @hoge32 = false

        if @request.snack == "あり"
          @hoge31 = true
        else
          @hoge32 = true
        end
#---------トイレ-------------------------------
        @hoge41 = false
        @hoge42 = false

        if @request.toilet == "1回"
          @hoge41 = true
        elsif@request.toilet == "2回"
          @hoge42 = true
        elsif@request.toilet == "3回"
          @hoge43 = true
        end
#---------留守番時間-------------------------------
        @hoge51 = false
        @hoge52 = false
        @hoge53 = false
        @hoge54 = false

        if @request.caretaker == "2時間以上"
          @hoge51 = true
        elsif@request.caretaker == "3時間以上"
          @hoge52 = true
        elsif@request.caretaker == "4時間以上"
          @hoge53 = true
        elsif@request.caretaker == "5時間以上"
          @hoge54 = true
        end
#---------子供-------------------------------
    @hoge61 = false
    @hoge62 = false

    if @request.child == "大丈夫"
      @hoge61 = true
    else
      @hoge62 = true
    end
#---------先住犬-------------------------------
    @hoge71 = false
    @hoge72 = false
    @hoge73 = false

    if @request.native == "大丈夫"
      @hoge71 = true
  elsif @request.native == "ダメ"
      @hoge72 = true
    else
      @hoge73 = true
    end
#---------他の動物-------------------------------
    @hoge81 = false
    @hoge82 = false
    @hoge83 = false

    if @request.animal == "大丈夫"
      @hoge81 = true
    elsif @request.animal == "ダメ"
      @hoge82 = true
    else
      @hoge83 = true
    end
#------------------日付の確認----------------------

    @request.save




  end



#===================================預かり依頼確認ページ===================================
  def check
    @request = Request.find_by(id: params[:id])
    @day = @request.waiting
    if @day.min == 0
      @min = "00"
    else
    end
    @day11 = @request.end
    if @day11.min == 0
      @min11 = "00"
    else
    end

    if @request.dog_id
      @dog1 = Dog.find_by(id: @request.dog_id)
      @dog_name = @dog1.name
    else
    end
    if @request.dog_id2
      @dog2 = Dog.find_by(id: @request.dog_id2)
      @dog_name = "#{@dog_name}" + "," + "#{@dog2.name}"
    else
    end
    if @request.dog_id3
      @dog3 = Dog.find_by(id: @request.dog_id3)
      @dog_name = "#{@dog_name}" + "," + "#{@dog3.name}"
    else
    end

  end

#=======================預かり依頼保存（確認ページへ）===================================
  def create_re
    params[:year].each do | di1,di2 |
        session[:year] = "#{di2}"
        @year = session[:year].to_i
    end
    params[:month].each do | di1,di2 |
        session[:month] = "#{di2}"
        @month = session[:month].to_i
    end
    params[:day1].each do | di1,di2 |
        session[:day] = "#{di2}"
        @day = session[:day].to_i
    end
    params[:hour].each do | di1,di2 |
        session[:hour] = "#{di2}"
        @hour = session[:hour].to_i
    end
    params[:min].each do | di1,di2 |
        session[:min] = "#{di2}"
        @min = session[:min].to_i
    end

    params[:year11].each do | di1,di2 |
        session[:year11] = "#{di2}"
        @year11 = session[:year11].to_i
    end
    params[:month11].each do | di1,di2 |
        session[:month11] = "#{di2}"
        @month11 = session[:month11].to_i
    end
    params[:day11].each do | di1,di2 |
        session[:day11] = "#{di2}"
        @day11 = session[:day11].to_i
    end
    params[:hour11].each do | di1,di2 |
        session[:hour11] = "#{di2}"
        @hour11 = session[:hour11].to_i
    end
    params[:min11].each do | di1,di2 |
        session[:min11] = "#{di2}"
        @min11 = session[:min11].to_i
    end
    #ラジオボタンのデータ
    params[:walk].each do | di1,di2 |
        session[:walk] = "#{di2}"
        @walk = session[:walk]
    end
    params[:walk_time].each do | di1,di2 |
        session[:walk_time] = "#{di2}"
        @walk_time = session[:walk_time]
    end
    params[:bait].each do | di1,di2 |
        session[:bait] = "#{di2}"
        @bait = session[:bait]
    end
    params[:snack].each do | di1,di2 |
        session[:snack] = "#{di2}"
        @snack = session[:snack]
    end
    params[:toilet].each do | di1,di2 |
        session[:toilet] = "#{di2}"
        @toilet = session[:toilet]
    end
    params[:caretaker].each do | di1,di2 |
        session[:caretaker] = "#{di2}"
        @caretaker = session[:caretaker]
    end
    params[:child].each do | di1,di2 |
        session[:child] = "#{di2}"
        @child = session[:child]
    end
    params[:native].each do | di1,di2 |
        session[:native] = "#{di2}"
        @native = session[:native]
    end
    params[:animal].each do | di1,di2 |
        session[:animal] = "#{di2}"
        @animal = session[:animal]
    end
    params[:ok_comment].each do | di1,di2 |
        session[:ok_comment] = "#{di2}"
        @ok_comment = session[:ok_comment]
    end
    params[:ng_comment].each do | di1,di2 |
        session[:ng_comment] = "#{di2}"
        @ng_comment = session[:ng_comment]
    end


    @today =  Date.today
    require "date"
    @waiting = DateTime.new(@year, @month, @day, @hour, @min, 45, 0.375)
    @end = DateTime.new(@today.year, @month11, @day11, @hour11, @min11, 45, 0.375)

    if @waiting < @today
          flash[:notice] = "待ち合わせ時間が過ぎています"
          redirect_to("/users/writing") and return
    elsif @end < @waiting
          flash[:notice] = "お迎え時間が正しくありません。"
          redirect_to("/users/writing") and return
    else

    end


    @request = Request.new(user_id: @user.id,
                           adress: params[:addr11],
                           status: 0,
                           status_partner: 0
    )
    @request.waiting = @waiting
    @request.end = @end
    @request.walk = @walk
    @request.walk_time = @walk_time
    @request.bait = @bait
    @request.snack = @snack
    @request.toilet = @toilet
    @request.caretaker = @caretaker
    @request.child = @child
    @request.native = @native
    @request.animal = @animal
    @request.comment_ok = @ok_comment
    @request.comment_ng = @ng_comment
    @request.save


#------------預ける犬選択---------------
    params[:dog_choice].each do | di1,di2 |
          if di2 == "1"
              if @request.dog_id == nil
                  @request.dog_id = "#{di1}"
              elsif @request.dog_id != nil
                  @request.dog_id2 = "#{di1}"
              elsif @request.dog_id2 != nil
                  @request.dog_id3 = "#{di1}"
              end
          end
    end
    @request.save


    #------------breedモデル作成（犬種検索用）---------------------

    if @request.dog_id
      @breed1 = Dog.find_by(id: @request.dog_id)
    end

    if @request.dog_id2
      @breed2 = Dog.find_by(id: @request.dog_id2)
    end

    if @request.dog_id3
      @breed3 = Dog.find_by(id: @request.dog_id3)
    end

    @breed = Breed.new(
      request_id: @request.id,
      waiting: @request.waiting,
      end: @request.end,
      address: @request.adress
    )

    @breed.save

    if @breed1
      @breed.breed1 = @breed1.dog_breed
    end
    if @breed2
      @breed.breed2 = @breed2.dog_breed
    end
    if @breed3
      @breed.breed3 = @breed3.dog_breed
    end

    @breed.save
    #------------breedモデル作成（犬種検索用）---------------------


    flash[:notice] = "預かり依頼を作成しました"
    session[:year] = nil
    session[:month] = nil
    session[:day] = nil
    session[:hour] = nil
    session[:min] = nil
    session[:year11] = nil
    session[:month11] = nil
    session[:day11] = nil
    session[:hour11] = nil
    session[:min11] = nil
    session[:walk] = nil
    session[:walk_time] = nil
    session[:bait] = nil
    session[:snack] = nil
    session[:toilet] = nil
    session[:caretaker] = nil
    session[:child] = nil
    session[:native] = nil
    session[:animal] = nil
    session[:ok_comment] = nil
    session[:ng_comment] = nil
    redirect_to("/users/check/#{@request.id}")


  end

#========================預かり依頼作成ページ================================
  def writing
    @dogs = Dog.where(user_id: session[:user_id])

    @year00 = session[:year]
    @month00 = session[:month]
    @day00 = session[:day]
    @hour00 = session[:hour]
    @min00 = session[:min]

    @year22 = session[:year11]
    @month22 = session[:month11]
    @day22 = session[:day11]
    @hour22 = session[:hour11]
    @min22 = session[:min11]

    @walk = session[:walk]
    @walk_time = session[:walk_time]
    @bait = session[:bait]
    @snack = session[:snack]
    @toilet = session[:toilet]
    @caretaker = session[:caretaker]
    @child = session[:child]
    @native = session[:native]
    @animal = session[:animal]
    @coment = session[:ok_comment]
    @coment2 = session[:ng_comment]

    if @walk.present?
        if @walk == "なし"
            @check1 = true
        elsif @walk == "1回"
            @check2 = true
        elsif @walk == "2回"
            @check3 = true
        elsif @walk == "3回"
            @check4 = true
        end
    end
    if @walk_time.present?
        if @walk_time == "15分程"
            @check5 = true
        elsif @walk_time == "30分程"
            @check6 = true
        elsif @walk_time == "1時間程"
            @check7 = true
        elsif @walk_time == "1時間以上"
            @check8 = true
        end
    end

    if @bait.present?
        if @bait == "2回"
            @check9 = true
        elsif @bait == "3回"
            @check10 = true
        end
    end

    if @snack.present?
        if @snack == "あり"
            @check11 = true
        elsif @snack == "なし"
            @check12 = true
        end
    end
    if @toilet.present?
        if @toilet == "1回"
            @check13 = true
        elsif @toilet == "2回"
            @check14 = true
        elsif @toilet == "3回"
            @check15 = true
        end
    end
    if @caretaker.present?
        if @caretaker == "2時間以上"
            @check16 = true
        elsif @caretaker == "3時間以上"
            @check17 = true
        elsif @caretaker == "4時間以上"
            @check18 = true
        elsif @caretaker == "5時間以上"
            @check19 = true
        end
    end

    if @child.present?
        if @child == "大丈夫"
            @check20 = true
        elsif @child == "ダメ"
            @check21 = true
        end
    end
    if @native.present?
        if @native == "大丈夫"
            @check22 = true
        elsif @native == "ダメ"
            @check23 = true
        elsif @native == "性別・犬種次第で大丈夫"
            @check24 = true
        end
    end
    if @animal.present?
        if @animal == "大丈夫"
            @check25 = true
        elsif @animal == "ダメ"
            @check26 = true
        elsif @animal == "トークルームで確認希望"
            @check27 = true
        end
    end


  end
#--------------新規会員登録---------------------
  def new
    @email = params[:email]
  end
#--------------ユーザー登録時---------------------
  def temporary
    @name = params[:name]
    @email = params[:email]
    @year = params[:year]
    @month = params[:month]
    @day = params[:day]

    @name_check = User.find_by(name: @name)
    @email_check = User.find_by(email: @email)

    if @email_check.blank? && @name_check.blank?
        @user = User.new(
            name: @name,
            email: @email,
            birthday1: @year + "/" + @month + "/" + @day,
            sex: params[:sex],
            created: 0
        )
        @user.password = params[:password]
        @user.save
  #----------画像があるかないか----------------
        if params[:image].nil?
        else
            @user.image_name = "#{@user.id}3.jpg"
            image = params[:image]
            @user.save

<<<<<<< HEAD
            File.binwrite("/Users/shinkaihideto/Desktop/remote/current/public/user_images/#{@user.image_name}", image.read)
=======
            File.binwrite("/Users/shinkaihideto/desktop/secondhouse_test0703/public/user_images/#{@user.image_name}", image.read)
>>>>>>> refs/remotes/origin/master
        end
    #----------保存できたらメール----------------
        if @user.save && @user.name.present?
            # トークン生成
            @token = SecureRandom.uuid
            @user_token = Token2.new(
                    user_id: @user.id,
                    uuid: @token,
                    expired_at: 168.hours.since
            )
            @user_token.save
            @mail = NotificationMailer.send_confirm_to_user(@user,@token).deliver
            flash[:notice] = "入力したメールアドレスに本登録のURLをお送りしました"
            redirect_to("/")
        else
            flash[:notice] = "登録できませんでした"
            render("users/new")
        end

    elsif @name_check.present?
        flash[:notice] = "そのユーザー名は既に使われています"
        render("users/new")
    elsif @name_check.present? && @user.created = 0
        @token = SecureRandom.uuid
        @user_token = Token2.find_by(user_id: @email_check.id)
        @user_token.save
        @mail = NotificationMailer.send_confirm_to_user(@email_check,@token).deliver
        redirect_to("/")
        render("/")
    else
        flash[:notice] = "そのメールアドレスは既に使われています"
        render("users/new")
    end

<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/master
  end
  def token
      # 有効期限の確認
      @token = Token2.find_by(uuid: params[:uuid])
      # 有効期限を過ぎていないか確認
      if @token && @token.expired_at > Time.now
          @user = User.find_by(id: @token.user_id)
          @user.created = 1
          @user.save
        # 登録完了メール通知
        flash[:notice] = "本登録が完了しました"
        @mail = NotificationMailer.send_registration(@user).deliver
        # ログイン画面へ
        redirect_to("/users/login")
      end
  end



  def login


  end

  def authentication
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password]) && @user.created == 1
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")

    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login")

    end

  end

  def show
#自己紹介文---------------------------------------------------
    @status = Status.find_by(user_id: session[:user_id])


#ユーザーの評価の配列があるかどうか-----------------------------------
    @storages = Storage.where(user_id: params[:id])
    @number2 = @storages.count


    #年齢表示計算-----------------------------------
    @date = Date.today
    @birthday = Date.parse(@user.birthday1)

    @year = @date.year -  @birthday.year
    @month = @date.month - @birthday.month
    @day = @date.day - @birthday.day


    if @month >= 0
    else
        @month = @month + 12
        @year -= 1
    end

    if @day >= 0
    else
    	@month = @month - 1
    end





  end

  def mydog
    @dog = Dog.find_by(user_id: session[:user_id])
    @dogs = Dog.where(user_id: session[:user_id])
    #年齢表示計算-----------------------------------
    @date = Date.today
    @dog_count = @dogs.length
  end

  def evaluation
<<<<<<< HEAD
      @evaluation_s = @evaluations
      @evaluation_s += @storages
=======
>>>>>>> refs/remotes/origin/master

#評価の件数---------------------------------------------------
    @dog_evaluations = DogEvaluation.where(user_id: session[:user_id])

  end

#利用履歴---------------------------------------------------
  def history
#評価の件数---------------------------------------------------
    @dog_evaluations = DogEvaluation.where(user_id: session[:user_id])


  end

  def introduction
    @status = Status.new(
    introduction: params[:introduction],
    user_id: session[:user_id])
    @status.save
    redirect_to("/users/#{params[:id]}")

  end

  def seen
    @seen = User.find_by(id: params[:id])
    @dog = Dog.find_by(user_id: params[:id])
    @dogs = Dog.where(user_id: params[:id])
    @status = Status.find_by(user_id: params[:id])

#フォローしているかしていないか-----------------------------------------
    @follow = Follow.find_by(user_id: session[:user_id],
                            receive: params[:id])

#評価の計算----------------------------------------------------------
    @evaluations = Evaluation.where(user_id: params[:id])
    @storages = Storage.where(user_id: params[:id])

    @number = @evaluations.count
    @number2 = @storages.count
    @user_evaluation = 0
    @user_storage = 0

    if @number == 0
    else
      @evaluations.each do | evaluation |
        @user_evaluation = @user_evaluation + evaluation.overall
      end
    end

    if @number2 == 0
    else
      @storages.each do | storage |
        @user_storage = @user_storage + storage.overall
      end
    end

    @user_evaluation = ((@user_storage.to_f + @user_evaluation.to_f) / (@number + @number2)).round(1)
#ここまで評価の計算----------------------------------------------------

    @date = Date.today
    @birthday = Date.parse(@user.birthday1)

    @year = @date.year -  @birthday.year
    @month = @date.month - @birthday.month
    @day = @date.day - @birthday.day


    if @month >= 0
    else
        @month = @month + 12
        @year -= 1
    end

    if @day >= 0
    else
      @month = @month - 1
    end
  end

  def update
    @user = User.find_by(id: params[:id])

      if params[:image].present?
<<<<<<< HEAD
        @image_name = @user.id + 100
        @user.image_name = "#{@image_name}.jpg"
        image = params[:image]
        @user.save

        File.binwrite("/Users/shinkaihideto/Desktop/remote/current/public/user_images/#{@user.image_name}", image.read)
=======
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        @user.save

        File.binwrite("/Users/shinkaihideto/desktop/secondhouse_test0703/public/user_images/#{@user.image_name}", image.read)
>>>>>>> refs/remotes/origin/master
        flash[:notice] = "プロフィールを更新しました"
      end

      if params[:image_header].present?
<<<<<<< HEAD
        @image_name_cover = @user.id + 100
        @user.image_header = "#{@image_name_cover}.jpg"
        image2 = params[:image_header]
        @user.save

        File.binwrite("/Users/shinkaihideto/Desktop/remote/current/public/images_header/#{@user.image_header}", image2.read)
=======
        @user.image_header = "#{@user.id}.jpg"
        image2 = params[:image_header]
        @user.save

        File.binwrite("/Users/shinkaihideto/desktop/secondhouse_test0703/public/images_header/#{@user.image_header}", image2.read)
>>>>>>> refs/remotes/origin/master
        flash[:notice] = "プロフィールを更新しました"

      end

      if params[:name].empty?
        else
        @user.name = params[:name]
        @user.save
        flash[:notice] = "プロフィールを更新しました"
      end

      if params[:introduction].empty?
      else
        @status = Status.find_by(user_id: @user.id)

        if @status
        else
          @status = Status.new(user_id: @user.id)
        end
        @status.introduction = params[:introduction]
        @status.save
        flash[:notice] = "プロフィールを更新しました"
      end
      redirect_to("/users/edit/#{@user.id}")

  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def impression
    @request = Request.find_by(id: params[:id])
    @owner_user = User.find_by(id: @request.user_id)

    @request.status_partner = 2
    @request.save


  end

#評価の追加------------------------------------------------------
  def judge
<<<<<<< HEAD
      @request = Request.find_by(id: params[:id])
=======
      @request = Request.find_by(user_id: params[:id])
>>>>>>> refs/remotes/origin/master
      @request.status_partner = 3
      if @request.status == 3
          @request.status_partner = 4
          @request.status = 4
      end
      @request.save
      @user = User.find_by(id: @request.user_id)
    @re
    @dog = Dog.find_by(user_id: params[:id])
    @evaluation = Evaluation.new(user_id: @user.id,
                                 rater_id: session[:user_id],
                                 overall: params[:overall],
                                 comment: params[:comment],
                                 request_id: @request.id)

    @dog_evaluation = DogEvaluation.new(user_id: @user.id,
                   rater_id: session[:user_id],
                   overall: params[:dog_overall],
                   comment: params[:dog_comment])

    @private = Private.new(user_id:@user.id,                                                         rater_id: session[:user_id],
                communication: params[:communication],
                service: params[:service])


    @evaluation.save
    @dog_evaluation.save
    @private.save

<<<<<<< HEAD

=======
    @history = History.new(user_id: session[:user_id],
                           partner: @user.id,
                           request: 1,)
    @history.save
>>>>>>> refs/remotes/origin/master



    flash[:notice] = "評価を送信しました"
    redirect_to("/users/seen/seen_evaluation/#{@user.id}")

  end

  def storage
      @request = Request.find_by(id: params[:id])
      @choiced_user = User.find_by(id: @request.choice)
      @request.status = 2
      @request.save


  end

  def judge_storage
    @request = Request.find_by(id: params[:id])
    @request_detail = RequestDetail.find_by(request_id: @request.id)
    if @request_detail
        @request_detail.status = 1
        @request_detail.save
    end

    @request.status = 3
    if @request.status_partner == 3
        @request.status = 4
        @request.status_partner = 4
    end
    @request.save

    @choiced_user = User.find_by(id: @request.choice)
    @storage = Storage.new(user_id:@choiced_user.id,
                rater_id: session[:user_id],
                overall: params[:overall],
                comment: params[:comment],
                communication: params[:communication],
                service: params[:service],
                request_id: @request.id
            )
    @storage.save

    @bell = Bell.new(user_id: @choiced_user.id,
    content: "飼い主さんから評価されました",
    read: 0,
    request_id: @request.id,
    sender_id: @request.user_id)
    @bell.save

    @history = History.new(user_id: session[:user_id],
                           partner: @choiced_user.id,
                           request: @request.id)
    @history.save

    flash[:notice] = "評価を送信しました"
    redirect_to("/users/seen/seen_evaluation/#{@choiced_user.id}")

  end

  def seen_evaluation
    @user = User.find_by(id: params[:id])
    @evaluations = Evaluation.where(user_id: params[:id])
    @dog_evaluations = DogEvaluation.where(user_id: params[:id])
    @storages = Storage.where(user_id: params[:id])
    @evaluations_storages = Evaluation.where(user_id: params[:id])
    @evaluations_storages += Storage.where(user_id: params[:id])

    @number = @evaluations.count
    @number2 = @storages.count

    if @number != 0
      @user_evaluation = 0
      @evaluations.each do | evaluation |
        @user_evaluation += evaluation.overall
      end
      @user_evaluation = (@user_evaluation.to_f / @number).round(1)
    end

    if @number2 != 0
        @user_storage = 0
        @storages.each do | storage |
            @user_storage += storage.overall
        end
        @user_storage = (@user_storage.to_f / @number2).round(1)
    end

    if( !@user_evaluation.nil? && !@user_storage.nil?)
        @user_evaluation = ((@user_evaluation + @user_storage) / 2).round(1)
    elsif(@user_evaluation.nil?)
        @user_evaluation = @user_storage
    end

  end

  def seen_evaluation_dog
    @user = User.find_by(id: params[:id])
    @dog = Dog.find_by(user_id: params[:id])
    @dog_evaluations = DogEvaluation.where(dog_id: @dog.id)

    @number = @dog_evaluations.count

    if @number == 0
    else
      @dog_evaluation = 0
      @dog_evaluations.each do | dog_evaluation |
        @dog_evaluation = @dog_evaluation + dog_evaluation.overall
      end
      @dog_evaluation = (@dog_evaluation.to_f / @number).round(1)
    end

  end

  def follow
    @follow = Follow.new(user_id: session[:user_id],
                          receive: params[:id],
                          valule: 1)
    @follow.save
    flash[:notice] = "フォローしました"

    @folower = User.find_by(id: session[:user_id])
    @bell = Bell.new(user_id: params[:id],
    content: "#{@folower.name}さんからフォローされました",
    read: 0,
    sender_id: session[:user_id])
    @bell.save

    redirect_to("/users/seen/#{params[:id]}")
  end

  def un_follow
    @follow = Follow.find_by(user_id: session[:user_id],
                             receive: params[:id])
    @follow.destroy
    flash[:notice] = "フォロー解除しました"
    redirect_to("/users/seen/#{params[:id]}")
  end

  def show_follow


      @follows = Follow.where(user_id: params[:id])
      @followers = Follow.where(receive: params[:id])
      @num_follow = @followers.count

      @date = Date.today
      @birthday = Date.parse(@user.birthday1)

      @year = @date.year -  @birthday.year
      @month = @date.month - @birthday.month
      @day = @date.day - @birthday.day


      if @month >= 0
      else
          @month = @month + 12
          @year -= 1
      end

      if @day >= 0
      else
      	@month = @month - 1
      end
  end

end
