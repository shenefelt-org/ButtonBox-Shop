require "test_helper"

class QuoteMailerTest < ActionMailer::TestCase
  test "quote_created" do
    mail = QuoteMailer.quote_created
    assert_equal "Quote created", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
