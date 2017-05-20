class ListensController < DestinationBaseController

  def show
    @songs = Song.all.decorate
    render 'listens/show', layout: 'destination'
  end

  def destination_purpose
    'listen to These Walls'
  end

end
