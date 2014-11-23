module NotesHelper
  def render_note_created_time(note)
    content_tag(:span, "", class: 'gicon-clock2') + note.created_at.strftime("%Y.%m.%d")
  end
end