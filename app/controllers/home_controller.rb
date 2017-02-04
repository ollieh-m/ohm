class HomeController < ApplicationController

  def show
    render 'home/show', layout: 'home'
  end

end
