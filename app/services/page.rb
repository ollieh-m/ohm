class Page
  attr_reader :title, :link, :sections

  def initialize(title:, link: '#', sections: [])
    @title = title
    @sections = sections
    @link = link
  end

  def self.generate_pages
    [
      self.new(title: 'Find out more', link: '/about', sections: [self.new(title: 'The band', link: '/about#band', sections: [self.new(title: 'Third level', link: '/about#third')]), self.new(title: 'Lyrics', link: '/about#lyrics')]),
      self.new(title: 'Listen', link: '/listen', sections: Song.all.map{|song| self.new(title: song.name)}),
      self.new(title: 'Get in touch', link: '/contact')
    ]
  end
end
