module NavTreeHelper

  def render_nav_tree(pages, html_string='', level=1)
    return html_string if pages.empty?

    pages.each do |page|
      html_string.prepend("<div>
                        <div class='page__title level#{level}'>
                          <i class='fa fa-arrow-right' aria-hidden='true'></i></i>
                          <h1>#{page.title}</h1>
                        </div>
                      </div>")
      html_string = render_nav_tree(page.sections, html_string, level+1)
    end

    html_string
  end

end

