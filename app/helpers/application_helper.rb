module ApplicationHelper
  def page_specific_id
    "#{controller_name}_#{action_name}"
  end

  def markdown(text)
    render_options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow' }
    }
    renderer = Html.new(render_options)

    options = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true
    }
    markdown = Redcarpet::Markdown.new(renderer, options)
    raw markdown.render(text)
  end
end
