class AboutsController < DestinationBaseController

  def show
    render 'abouts/show', layout: 'destination', locals: {
      about_page: AboutPage.new
    }
  end

  def destination_purpose
    'find out about These Walls'
  end

end
