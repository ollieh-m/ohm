class MailgunClient

  def self.send_email(from:, to:, subject:, html:, text:)
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.from(from)
    mb_obj.add_recipient(:to, to)
    mb_obj.subject(subject)
    mb_obj.body_text(text)
    mb_obj.body_html(html)
    mb_obj.message_id(nil)
    mg_client.send_message(ENV['MAILGUN_DOMAIN'], mb_obj)
  end

end
