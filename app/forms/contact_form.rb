class ContactForm

  include ActiveModel::Model

  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true

  attr_accessor :name, :email, :message, :sent

end
