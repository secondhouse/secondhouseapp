class InquiryMailer < ApplicationMailer


  def send_mail(inquiry)
    @email = params[:email]

    @inquiry = inquiry
    mail(
      from: 'secondhouse111@gmail.com',
      to:    "@email",
      subject: 'お問い合わせ通知'
    )
  end

end
