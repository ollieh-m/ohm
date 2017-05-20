class SongDecorator < Draper::Decorator
  delegate_all

  def anchor
    object.name.camelize.gsub(/[\s+']/, '').underscore
  end

end
