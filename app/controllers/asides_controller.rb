class AsidesController < ApplicationController

  def show
    @pages = Page.generate
    render_to_string 'asides/show'
  end

end
