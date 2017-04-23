class NavsController < ApplicationController

  def create
    case params[:nav][:to]
    when 'find out more'
      redirect_to about_path
    when 'listen'
      redirect_to listen_path
    when 'get in touch'
      redirect_to contact_path
    else
      redirect_to home_path
    end
  end

end
