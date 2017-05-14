module NavTreeHelper

  def render_nav_tree(pages, html_string='', parent=nil, level=1)
    return html_string if pages.empty?

    pages.each do |page|
      _parent = parent.nil? ? page.title : parent
      html_string.prepend("<div>
                            <div class='page__title'>
                              <i class='fa fa-arrow-right' aria-hidden='true' data-parent='#{_parent}' data-level='#{level}'></i></i>
                              <h1><a href='#{page.link}'>#{page.title}</a></h1>
                            </div>
                          </div>")
      html_string = render_nav_tree(page.sections, html_string, page.title, level+1)
    end

    html_string
  end

end

