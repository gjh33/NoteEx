class Api::NotesController < ApiController
  def upload
    note = Note.new(attachment: params[:attachment])
    if note.save
      render_success
    else
      render_error("Upload Failed", note.errors.full_messages.first)
    end
  end
end
