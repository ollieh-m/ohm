class Page
  attr_reader :title, :sections

  def initialize(title:, sections: [])
    @title = title
    @sections = sections.map do |section|
      Section.new(title: section)
    end
  end

  class Section
    attr_reader :title

    def initialize(title:)
      @title = title
    end
  end

  def self.generate
    [
      self.new(title: 'Find out more', sections: ['The band', 'Words']),
      self.new(title: 'Listen', sections: Song.all.map(&:name)),
      self.new(title: 'Get in touch')
    ]
  end
end
