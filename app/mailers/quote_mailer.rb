class QuoteMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.quote_mailer.quote_created.subject
  #
  def quote_created(quote)
    @quote = quote
    @customer = quote.customer

    mail(
      to: @customer.email,
      subject: "New Quote #{@quote.quote_number}"
    )
  end
end
