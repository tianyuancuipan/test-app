require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account activation" do
    user = users(:anny)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "PandaVisas: account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@pandavisas.com"], mail.from
    assert_match user.firstname, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

  test "password_reset" do
    user = users(:anny)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "PandaVisas: password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@pandavisas.com"], mail.from
    assert_match user.reset_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end
end
