class Page
  attr_reader :title, :sections

  def initialize(title:, sections: [])
    @title = title
    @sections = sections.map do |section|
      Page.new(title: section)
    end
  end

  def self.generate_pages
    [
      self.new(title: 'Find out more', sections: ['The band', 'Words']),
      self.new(title: 'Listen', sections: Song.all.map(&:name)),
      self.new(title: 'Get in touch')
    ]
  end
end
