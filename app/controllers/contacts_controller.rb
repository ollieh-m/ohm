class ContactsController < DestinationBaseController

  def show
    @contact_form = ContactForm.new
    render 'contacts/show', layout: 'destination'
  end

  def create

  end

  def destination_purpose
    'contact These Walls'
  end

end
