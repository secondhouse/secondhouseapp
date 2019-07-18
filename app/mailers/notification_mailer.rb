class NotificationMailer < ApplicationMailer

    default from: "secondhouse111@gmail.com"

    def send_confirm_to_user(user, token)
      @user = user
      @token = token
        mail to:      user.email,
             subject: '[SecondHouse]本登録のご案内'
    end


    def send_registration(user)
        @user = user
        mail to:      user.email,
        subject: '[SecondHouse]本登録完了いたしました'
    end

    def change_pass(user, token)
        @user = user
        @token = token
        mail to:      user.email,
        subject: 'パスワード変更用のURLをお送りしました'
    end
 end
