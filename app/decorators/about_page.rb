class AboutPage

  attr_reader :songs

  def initialize
    @songs = Song.all
  end

end
