class ContactsController < DestinationBaseController

  def show
    render 'contacts/show', layout: 'destination'
  end

  def destination_purpose
    'contact These Walls'
  end

end
