class ContactMailer

  include ActionView::Helpers::TextHelper

  attr_reader :contact

  def initialize(contact)
    @contact = contact
  end

  def forward_message
    MailgunClient.send_email(
      from: Rails.env + '-website@these-walls.com',
      to: ENV['MAILGUN_TO_ADDRESS'],
      subject: "Message received from #{contact.name}",
      html: html_message,
      text: text_message
    )
  end
  handle_asynchronously :forward_message

  def html_message
    '<h1>' + contact.email + '<h1>' + simple_format(contact.message)
  end

  def text_message
    contact.email + ' - ' + contact.message
  end

end
