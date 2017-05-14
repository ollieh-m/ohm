class Page
  attr_reader :title, :link, :sections

  def initialize(title:, link: '#', sections: [])
    @title = title
    @sections = sections
    @link = link
  end

  def self.generate_pages
    [
      self.new(title: 'Find out more', link: '/about', sections: [self.new(title: 'The band'), self.new(title: 'Words')]),
      self.new(title: 'Listen', link: '/listen', sections: Song.all.map{|song| self.new(title: song.name)}),
      self.new(title: 'Get in touch', link: '/contact')
    ]
  end
end
