class ContactsController < DestinationBaseController

  def show
    @contact_form = ContactForm.new
    render 'contacts/show', layout: 'destination'
  end

  def create
    contact = ContactForm.new(contact_params)
    if contact.valid?
      ContactMailer.new(contact).forward_message
      @contact_form = ContactForm.new(sent: true)
    end
    render 'contacts/show', layout: 'destination'
  end

  def destination_purpose
    'contact These Walls'
  end

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end

end
