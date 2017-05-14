class AsidesController < ApplicationController

  def show
    @pages = Page.generate_pages
    render_to_string 'asides/show'
  end

end
