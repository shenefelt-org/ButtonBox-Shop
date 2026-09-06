# Preview all emails at http://localhost:3000/rails/mailers/quote_mailer
class QuoteMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/quote_mailer/quote_created
  def quote_created
    QuoteMailer.quote_created
  end
end
