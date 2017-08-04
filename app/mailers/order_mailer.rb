class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation_email(order)
    @order = order
    puts "email sent"
    mail(to: @order.email, subject: "Order #{order.id} Thanks for swinging by the Jungle!")
  end

end