class DogController < ApplicationController
    caches_page :search
    before_action :authenticate_user, {only: [:search, :details, :management, :entrusted]}
    #before_action :detail_user,{only: [:details]}
    #before_action :flow_count,{only: [:details]}
    #before_action :history_count,{only: [:details]}
    #before_action :evaluations_calculation,{only: [:details]}

#預かる人の確認画面------------------


    def entrusted
        @request = Request.find_by(id: params[:id])
        @user_owner = User.find_by(id: @request.user_id)
        @entries = Entry.where(request_id: @request.id)
        @choiced_user = User.find_by(id: @request.choice)
        @now_time = DateTime.now
        @num = 0
        @count = 0

<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/master
        if @request.dog_id
            @dog1 = Dog.find_by(id: @request.dog_id)
        end
        if @request.dog_id2
            @dog2 = Dog.find_by(id: @request.dog_id)
        end
        if @request.dog_id3
            @dog3 = Dog.find_by(id: @request.dog_id)
        end

        if !@user_owner.nil?
            @date1 = Date.today
            @birthday1 = Date.parse(@user_owner.birthday1)

            @year1 = @date1.year -  @birthday1.year
            @month1 = @date1.month - @birthday1.month
            @day1 = @date1.day - @birthday1.day

            if @month1 >= 0
            else
                @month1 = @month1 + 12
                @year1 -= 1
            end

            if @day1 >= 0
            else
                @month1 = @month1 - 1
            end
        end

    end
    #エントリー取り消し------------------
    def entry_delete
        @entry = Entry.find_by(id: params[:id])
        flash[:notice] = "エントリーを削除しました"
        @entry.destroy
        redirect_to("/users/rely/#{session[:user_id]}")
    end

    def choice_user
        @request = Request.find_by(id: params[:id])
        @request.status = 1
        @request.status_partner = 1
        @request.save
        @user = User.find_by(id: @request.user_id)
        @messeage = "預かってもらうユーザを決定しました"


        if params[:choiceUser].present?
            @request.choice = params[:choiceUser]
        else
            @request.choice = params[:entry_choice]
        end
        @request.save

        #お知らせ
        @bell = Bell.new(user_id: @request.choice,
            content: "ワンちゃんの飼い主さんがあなたを選びました。メッセージを送ってみましょう",
            read: 0,
            request_id: @request.id,
            sender_id: @request.user_id)
        @bell.save

        #支払い処理
        @price = params[:price]
        if @price.present?
<<<<<<< HEAD
            @id = (@current_user.id + 100000).to_s
=======
            @id = (@current_user.id + 1000).to_s
>>>>>>> refs/remotes/origin/master
            require 'payjp'
            Payjp.api_key = 'sk_test_52112ae44d12e9e7b86c9873'
            charge = Payjp::Charge.create(
                :amount => @price,
                :customer => @id,
                :currency => 'jpy'
             )
             @messeage = "支払いが完了し、預かってもらうユーザを決定しました"
             @pay = RequestDetail.new(
                    request_id: @request.id,
                    amount: @price,
                    pay: @current_user.id,
                    recieve: @request.choice,
                    already: 0,
                    status: 0
                )
            @pay.save
        end

        redirect_to controller: 'dog', action: 'management', id: @request.id, :notice => @messeage
    end
    #=================依頼管理ページ================================
    def management

        flash[:notice] = params[:notice]

        @request = Request.find_by(id: params[:id])
        @entries = Entry.where(request_id: @request.id)
        @choiced_user = User.find_by(id: @request.choice)
        @user_detail = UserDetail.find_by(user_id: @current_user.id)
        @num = 0
        @count = 0
        @dog_num = 0
<<<<<<< HEAD
        @numss = 0
        @countss = 0
=======
>>>>>>> refs/remotes/origin/master

        if @request.dog_id
            @dog1 = Dog.find_by(id: @request.dog_id)
            @dog_num += 1
        end
        if @request.dog_id2
            @dog2 = Dog.find_by(id: @request.dog_id)
            @dog_num += 1
        end
        if @request.dog_id3
            @dog3 = Dog.find_by(id: @request.dog_id)
            @dog_num += 1
        end
        #料金計算
<<<<<<< HEAD
        @witing = @request.waiting
        @end = @request.end
        @use_hour = @end - @witing
        @use_hour = (@use_hour / 3600).to_i

        @price = 216 * @use_hour * @dog_num
=======
        @witing = @request.waiting.to_date
        @end = @request.end.to_date
        @use_day = @end - @witing
        @use_day = @use_day.to_i

        @price = 2138 * @use_day * @dog_num
>>>>>>> refs/remotes/origin/master


        if !@choiced_user.nil?
            @date1 = Date.today
            @birthday1 = Date.parse(@choiced_user.birthday1)

            @year1 = @date1.year -  @birthday1.year
            @month1 = @date1.month - @birthday1.month
            @day1 = @date1.day - @birthday1.day

            if @month1 >= 0
            else
                @month1 = @month1 + 12
                @year1 -= 1
            end

            if @day1 >= 0
            else
                @month1 = @month1 - 1
            end
        end


    end


    #=================依頼内容詳細================================
  def entry
    @request = Request.find_by(id: params[:id])
    @entry = Entry.new(request_id: @request.id,
        user_id: @request.user_id,
        entry_id: session[:user_id])
    @entry.save

    @bell = Bell.new(user_id: @request.user_id,
    content: "預かり依頼にエントリーがありました",
    read: 0,
    request_id: @request.id,
    sender_id: @entry.entry_id)
    @bell.save

    flash[:notice] = "エントリーしました"
    redirect_to("/dog/details/#{@request.id}")
  end
   #=================依頼内容詳細================================
  def details
    @request = Request.find_by(id: params[:id])
    @user = User.find_by(id: @request.user_id)
    @day1 = @request.waiting
    @day2 = @request.end
    @entry = Entry.find_by('entry_id = ? and request_id = ?', session[:user_id],@request.id)

    @evaluations = Evaluation.where(user_id: @user.id)
    @number = @evaluations.count
    @storages = Storage.where(user_id: @user.id)
    @number2 = @storages.count

    if @number == 0
        else
        @user_evaluation = 0
        @evaluations.each do | evaluation |
            @user_evaluation = @user_evaluation + evaluation.overall
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

    @histories = History.where(partner: @user.id)
    @num = @histories.count

    @user_detail = UserDetail.find_by(user_id: @user.id)
    @bank = Bank.find_by(user_id: @user.id)

    @follows = Follow.where(receive: @user.id)
    @num_follow = @follows.count


  end



#===========================検索====================================================
  def search
    require "date"
    @adress = params[:addr11]

    @breed = params[:dog_breed][:choice]
    if @breed == "指定なし"
        @breed = nil
    end

    if params[:date].present?
        if params[:date][:date_on].present?
              @day_search = params[:date][:date_on]
              @day = Date.parse("#{@day_search}")
        end
    end


    if @day_search.present? && @adress.present? && @breed.present?#日付と住所と犬種で検索
        @breed_adress_days = Breed.where(waiting: @day.in_time_zone.all_day).where("address LIKE ?", "%#{@adress}%").where("(breed1 = ?) OR (breed2 = ?) OR (breed3 = ?)", @breed, @breed, @breed).order('waiting asc')


    elsif @day_search.present? && @adress.present?#日付と住所で検索
        @adress_days = Request.where(waiting: @day.in_time_zone.all_day).where("adress LIKE ?", "%#{@adress}%").order('waiting asc')

    elsif @day_search.present? && @breed.present?#日付と犬種で検索
        @breed_days = Breed.where("(breed1 = ?) OR (breed2 = ?) OR (breed3 = ?)", @breed, @breed, @breed).where(waiting: @day.in_time_zone.all_day).order('waiting asc')

    elsif @adress.present? && @breed.present?#住所と犬種で検索
        @adress_breeds = Breed.where("(breed1 = ?) OR (breed2 = ?) OR (breed3 = ?)", @breed, @breed, @breed).where("address LIKE ?", "%#{@adress}%").order('waiting asc')

    else
        if @day_search.blank?
        else
             @days = Request.where(waiting: @day.in_time_zone.all_day)
        end

        if @adress.blank?
        else
            @adresses = Request.where("adress LIKE ?", "%#{@adress}%").order('waiting asc')
        end

        if @breed.blank?
        else
            @breeds = Breed.where("(breed1 = ?) OR (breed2 = ?) OR (breed3 = ?)", @breed, @breed, @breed).order('waiting asc')
        end


    end

  end


  def new
      @name_val = session[:dog_name]
      @year2 = session[:year2]
      @month2 = session[:month2]
      @day2 = session[:day2]
      @sex_kind = session[:sex_kind]
      @castration = session[:castration]
      @breed = session[:breed]
      @weight2 = session[:weight2]

      @check1 = false
      @check2 = false
      @check3 = false
      @check4 = false
      if  @sex_kind.present?
          if @sex_kind == "男の子"
              @check1 = true
          else
              @check2 = true
          end
      end
      if  @castration.present?
          if @castration == "している"
              @check3 = true
          else
              @check4 = true
          end
      end
  end


def create
    params[:dog_breed].each do | di1,di2 |
        session[:breed] = "#{di2}"
        @breed = session[:breed]
    end

    params[:weight].each do | di1,di2 |
        session[:weight2] = "#{di2}"
        @weight = session[:weight2]
    end
    params[:page].each do | di1,di2 |
        session[:dog_name]  = "#{di2}"
        @name = session[:dog_name]
    end
    params[:sex_kind].each do | di1,di2 |
        session[:sex_kind]  = "#{di2}"
        @sex_kind = session[:sex_kind]
    end
    params[:castration].each do | di1,di2 |
        session[:castration]  = "#{di2}"
        @castration = session[:castration]
    end

    params[:year].each do | di1,di2 |
        @year2 = "#{di2}".to_i
        session[:year2] = @year2
    end

    params[:month].each do | di1,di2 |
        @month2 = "#{di2}".to_i
        session[:month2] = @month2
    end

    params[:day1].each do | di1,di2 |
        @day2 = "#{di2}".to_i
        session[:day2] = @day2
    end


    @today =  Date.today
    @hour = 0
    @min = 0
    require "date"
    @birthday00 = DateTime.new(@year2, @month2, @day2, @hour, @min, 45, 0.375)

    if @birthday00 > @today
        flash[:notice] = "誕生日が正しくありません"
        redirect_to("/dog/new/#{@current_user.id}") and return
    end


    @dog = Dog.new(name: @name,
            sex: @sex_kind,
            dog_breed: @breed,
            rabies: params[:rabies],
            user_id: @current_user.id,
            weight: @weight,
            castration: @castration
        )
    @dog.save
    @dog.birthday = @year2.to_s + "/" +  @month2.to_s + "/" + @day2.to_s



    #画像登録---------------------------------------------
    if params[:image_name].nil?
    else
      @dog.image_name = "#{@dog.id}3.jpg"
      image = params[:image_name]
      @dog.save

<<<<<<< HEAD
      File.binwrite("/Users/shinkaihideto/Desktop/remote/current/public/dog_images/#{@dog.image_name}", image.read)
=======
      File.binwrite("/Users/shinkaihideto/desktop/secondhouse_test0703/public/dog_images/#{@dog.image_name}", image.read)
>>>>>>> refs/remotes/origin/master
    end

    params[:character].each do | di1,di2 |
        if di2 == "1"
            if @dog.character == nil
                @dog.character = "#{di1}"
            else
                @dog.character = "#{@dog.character}" + "," + "#{di1}"
            end
        end
    end

    @dog.save
    flash[:notice] = "ワンちゃんプロフィールを作成しました"
    session[:dog_name] = nil
    session[:year2] = nil
    session[:month2] = nil
    session[:day2] = nil
    session[:sex_kind] = nil
    session[:castration] = nil
    session[:breed] = nil
    session[:weight2] = nil
    redirect_to("/users/mydog/#{@current_user.id}")
    end





    def create_my

      @dog = Dog.new(name: params[:name],
        image_name: params[:image_name],
        sex: params[:sex],
        birthday: params[:year] + "/" +  params[:month] + "/" + params[:day],
        dog_breed: params[:dog_breed],
        weight: params[:weight],
        castration: params[:castration],
        rabies: params[:rabies],
        user_id: session[:user_id])


      params[:character].each do | di1,di2 |
        if di2 == "1"
            if @dog.character == nil
                @dog.character = "#{di1}"
            else
                @dog.character = "#{@dog.character}" + "," + "#{di1}"
            end
        end
      end

        @dog.save
        redirect_to("/users/mydog/:id")
      end


      def introduction
        @info = Information.new(user_id: session[:user_id],
                                    dog_id: params[:id],
                                    introduction: params[:introduction]
                                    )
        @info.save
        redirect_to("/users/mydog/#{session[:user_id]}")
      end

end
