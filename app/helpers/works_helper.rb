module WorksHelper
  def render_highlight_content(work,query_string)
    excerpt_cont = excerpt(work.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end
end
