class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt_email(order)
    @order = order
    @url = 'http://localhost:3000/orders/#{order.id}'
    mail(to: @order.email, subject: 'welcome to the mailer.')
  end

end
