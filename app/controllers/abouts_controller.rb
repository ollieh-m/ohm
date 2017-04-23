class AboutsController < DestinationBaseController

  def show
    render 'abouts/show', layout: 'destination'
  end

  def destination_purpose
    'find out about These Walls'
  end

end
