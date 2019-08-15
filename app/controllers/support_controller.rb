class SupportController < ApplicationController
    before_action :authenticate_user, {only: [:configuration, :email, :phone, :password, :cc, :user_information, :user_identification, :bank, :bank_create, :revenue, :transfer, :payment_cc]}
    before_action :detail_user,{only: [:uproad, :password, :email, :detail_create, :user_identification, :user_information, :cc, :phone, :configuration, :bank, :bank_create, :revenue, :transfer, :payment_cc]}
    before_action :flow_count,{only: [:user_information, :cc, :phone, :configuration, :password, :email, :bank, :bank_create, :revenue, :transfer, :payment_cc]}
    before_action :history_count,{only: [:cc, :phone, :configuration, :password, :email, :bank, :bank_create, :revenue, :transfer, :user_information, :payment_cc]}
    before_action :evaluations_calculation,{only: [:password, :email, :user_information, :cc, :phone, :configuration, :bank, :bank_create, :revenue, :transfer, :payment_cc]}
    protect_from_forgery #追記

    def transfer
        @bank = Bank.find_by(user_id: @current_user.id)
        @total  = 0
        @balances = RequestDetail.where(recieve: @current_user.id).where(already: 0)
        @balances.each do | balance |
            @total += balance.amount
            balance.already = 1
            balance.save
        end


        @total  = (@total * 0.73).floor
        @transfer = Transfer.new(
            user_id: @current_user.id,
            total: @total,
            bank_id: @bank.id,
            status: 0
        )
        @transfer.save

        flash[:notice] = "振込申請をしました"
        redirect_to("/support/revenue")

    end

    def revenue
        @total = 0
        @total_month = 0
        @total_balance = 0

        @sales = RequestDetail.where(recieve: @current_user.id).where(status: 1)
        @sales.each do | sale |
            @total += sale.amount
        end

        @time = Time.now
        @this_month = @time.beginning_of_month..@time.end_of_month
        @sales_months = RequestDetail.where(recieve: @current_user.id).where(created_at: @this_month).where(status: 1)
        @sales_months.each do | sales_month |
            @total_month += sales_month.amount
        end

        @balances = RequestDetail.where(recieve: @current_user.id).where(already: 0).where(status: 1)
        @balances.each do | balance |
            @total_balance += balance.amount
        end

        @waiting = 0
        @transfers = Transfer.where(user_id: @current_user.id).where(status: 0)
        if @transfers.present?
            @transfers.each do | transfer |
                @waiting += transfer.total
            end
        end
        @total  = (@total * 0.73).floor
        @total_month = (@total_month * 0.73).floor
        @total_balance = (@total_balance * 0.73).floor

        @bank = Bank.find_by(user_id: @current_user.id)



    end


    def payment


    end

    def pay_test


    end

    def payment_cc

        require 'payjp'
        api_key = 'sk_test_52112ae44d12e9e7b86c9873'
        Payjp.api_key = api_key
        @token = params['payjpToken']
<<<<<<< HEAD
        @id = @user.id + 100000
=======
        @id = @user.id + 10000
>>>>>>> refs/remotes/origin/master

        if @token.present?
            Payjp::Customer.create(card: @token, email: "#{@current_user.email}", id: @id)
            @user_detail = UserDetail.find_by(user_id: @user.id)
            @user_detail.pay = 1
            @user_detail.save
            flash[:notice] = "カード情報を登録しました"
        else
            flash[:notice] = "カード情報が正しくありません"
        end

        render("/support/cc")

    end

    def password_reset
        @user = User.find_by(id: params[:user])
        @user.password = params[:password]
        @user.save
        flash[:notice] = "パスワードを再設定しました"
        render("/users/login")
    end



    def pass_setting
        # 有効期限の確認
        @token = Token2.find_by(uuid: params[:uuid])
        if @token && @token.expired_at > Time.now
            @user = User.find_by(id: @token.user_id)
        else
            flash[:notice] = "URLの有効期限が過ぎています"
            redirect_to("/")
        end
    end

    def pass_set
        @user = User.find_by(email: params[:page][:email])

        if @user
            # トークン生成
            @token = SecureRandom.uuid
            @user_token = Token2.new(
                    user_id: @user.id,
                    uuid: @token,
                    expired_at: 168.hours.since
            )
            @user_token.save
            @mail = NotificationMailer.change_pass(@user,@token).deliver
            flash[:notice] = "入力したメールアドレスにパスワード変更用ののURLをお送りしました"
            render("support/re_password")
        else
            flash[:notice] = "入力されたアドレスは登録されていません"
            render("support/re_password")
        end
    end

    def re_password

    end

    def uproad
        @user_detail.id_image1 = "#{@user.id}.jpg"
        @user_detail.id_image2 = "#{@user.id}2.jpg"
        @user_detail.save
        image1 = params[:file1]
        image2 = params[:file2]

<<<<<<< HEAD
        File.binwrite("/Users/shinkaihideto/Desktop/remote/current/public/id_image/#{@user_detail.id_image1}", image1.read)

        if image2.present?
        File.binwrite("/Users/shinkaihideto/Desktop/remote/current/public/id_image/#{@user_detail.id_image2}", image2.read)
=======
        File.binwrite("/Users/shinkaihideto/desktop/secondhouse_test0703/public/id_image/#{@user_detail.id_image1}", image1.read)

        if image2.present?
        File.binwrite("/Users/shinkaihideto/desktop/secondhouse_test0703/public/id_image/#{@user_detail.id_image2}", image2.read)
>>>>>>> refs/remotes/origin/master
        end

        flash[:notice] = "添付書類をアップロードしました"
        redirect_to("/support/user_identification")
    end

    def bank_delete
        @bank = Bank.find_by(user_id: @current_user.id)
        @bank.delete
    end

    def bank
        @bank = Bank.find_by(user_id: @current_user.id)
    end

    def bank_create

        @user_detail = UserDetail.find_by(user_id: @current_user.id)
        @user_name = @user_detail.name_last_reading + @user_detail.name_first_reading
        if @user_name == params[:name]
            @bank = Bank.new(
                user_id: @current_user.id,
                bank_name: params[:bank_name],
                branch: params[:branch],
                kind: params[:bank_kind],
                number: params[:number],
                name: params[:name]
            )
            @bank.save
            flash[:notice] = "口座を登録しました"
            render("support/bank")
        else
            flash[:notice] = "登録エラーが発生しました。正しい内容で入力されているか確認お願いします"
            @bank_name = params[:bank_name]
            @branch = params[:branch]
            @number11 = params[:number]
            @name = params[:name]
            render 'support/bank', item: @bank_name, item: @branch, item: @number11, item: @name
        end
    end




    def user_edit_card

        @card = Card.new(
            user_id: @user.id,
            number: params[:number],
            year: params[:year],
            mouth: params[:mouth],
            name: params[:name],
            code: params[:code],
        )
        @card.save
        flash[:notice] = "カード情報を登録しました"

        redirect_to("/support/cc")

    end

    def user_edit_pass
        @pass_now = params[:pass_now]
        @pass1 = params[:pass1]
        @pass2 = params[:pass2]
        flash[:notice] = nil

        if @user && @user.authenticate(params[:pass_now])
            if  @pass1 == @pass2
                @user.password = @pass1
                flash[:notice] = "パスワードを変更しました"
                @user.save
            else
                flash[:notice] = "新しいパスワードが一致していません"
            end
        else
            flash[:notice] = "パスワードが違います"
        end

        redirect_to("/support/password")
    end
    def password

    end

    def email

    end
    def user_edit
        if @user && @user.authenticate(params[:email_pass])
            params[:email_inp].each do | di1,di2 |
                @user.email = "#{di2}"
            end
            @user.save
            flash[:notice] = "メールアドレスを変更しました"
        else
            flash[:notice] = "パスワードが違います"
        end

        redirect_to("/support/email")
    end

    def detail_create
        if @user_detail.blank?
            @user_detail = UserDetail.new(user_id: @user.id)
        end

        if params[:phone].present?
            @user_detail.phone = params[:phone]
            flash[:notice] = "電話番号を登録しました"
            redirect_to("/support/phone") and return
        end

        if params[:user_kind].present?
            @user_detail.user_kind = params[:user_kind]
        end

        if params[:name_last].present?
            @user_detail.name_last = params[:name_last]
        end

        if params[:name_first].present?
            @user_detail.name_first = params[:name_first]
        end

        if params[:name_last_reading].present?
            @user_detail.name_last_reading = params[:name_last_reading]
        end

        if params[:name_first_reading].present?
            @user_detail.name_first_reading = params[:name_first_reading]
        end

        if params[:address].present?
            @user_detail.address = params[:address]
        end

        if params[:sex].present?
            params[:sex].each do | di1,di2 |
              @user.sex = "#{di2}"
            end
        end

        if params[:year].present? && params[:month].present? && params[:day].present?
            @user.birthday1 = params[:year] + "/" +  params[:month] + "/" + params[:day]
        end

        @user.save
        @user_detail.save
        flash[:notice] = "会員情報を更新しました"
        redirect_to("/support/user_information")

    end
    def user_identification

    end
    def user_information
        @birthday = Date.parse(@user.birthday1)
        @check1 = false
        @check2 = false

        if @user.sex == "男性"
            @check1 = true
        else
            @check2 = true
        end

    end

    def cc



    end

    def phone



    end

    def configuration

    end

    def question
        @question = Question.new(
            user_id: @user.id,
            content: params[:kind_item],
            kind: params[:kind],
            emai: @user.email
        )
        @question.save
        flash[:notice] = "お問い合わせ内容を送信しました"
        redirect_to("/support/inquiry")
    end

    def inquiry
    end

    def recruitment

    end
    def company_profile

    end
    def user_introduction

    end
    def mouth

    end
    def about_fee

    end
    def user_check

    end
    def about_evaluation

    end
    def rule

    end
   def flow

   end
  def entrusted_dog


  end
  def deposit_dog

  end
  def index
  end

  def registration_question
  end

  def deposit
  end

  def entrusted
  end

  def ban
  end

  def system
  end

  def other
  end

  def registration
  end

  def registration1
  end

  def registration2
  end
  def registration3
  end
  def registration4
  end
  def registration5
  end
  def registration6
  end
  def registration7
  end
  def registration8
  end
  def registration9
  end
  def registration10
  end
  def registration11
  end
  def registration12
  end
  def registration13
  end
  def registration14
  end
  def registration15
  end
  def registration16
  end
  def registration17
  end
  def registration18
  end
  def registration19
  end
  def registration20
  end
  def registration21
  end
  def registration22
  end
  def registration23
  end
  def registration24
  end
  def registration25
  end
  def registration26
  end
  def registration27
  end
  def registration27_1
  end
  def registration28
  end
  def registration29
  end
  def registration30
  end
  def registration31
  end
  def registration32
  end
  def registration33
  end
  def registration34
  end
  def registration35
  end
  def registration36
  end
  def registration37
  end
  def registration38
  end
  def registration39
  end
  def registration39_1
  end
  def registration40
  end
  def registration41
  end
  def registration42
  end
  def registration43
  end
  def registration44
  end
  def registration45
  end
  def registration46
  end
  def registration47
  end
  def registration48
  end
  def registration49
  end
  def registration50
  end
  def registration51
  end
  def registration52
  end
  def registration53
  end
  def registration54
  end
  def registration55
  end
  def registration56
  end
  def registration57
  end

  def registration58
  end
  def registration59
  end
  def registration60
  end
  def registration61
  end
  def registration62
  end
  def registration63
  end
  def registration64
  end
  def registration65
  end
  def registration66
  end
  def registration67
  end

  def registration68
  end
  def registration69
  end
  def registration70
  end
  def registration71
  end
  def registration72
  end
  def registration73
  end
  def registration74
  end
  def registration75
  end
  def registration76
  end
  def registration77
  end
  def registration78
  end
  def registration79
  end
  def registration80
  end
  def registration81
  end
  def registration82
  end
  def registration83
  end
  def registration84
  end
  def registration85
  end
  def registration86
  end
  def registration87
  end
  def registration88
  end









end
