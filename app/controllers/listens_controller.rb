class ListensController < DestinationBaseController

  def show
    render 'listens/show', layout: 'destination'
  end

  def destination_purpose
    'listen to These Walls'
  end

end
