class PaymentDecorator < BaseDecorator
  def payment_month
    "#{month.strftime('%Y %B')}"
  end
end
