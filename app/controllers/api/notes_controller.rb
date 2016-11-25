class Api::NotesController < ApiController
  def upload
    note = Note.new(attachment: params[:attachment])
    if note.save
      current_user.points += 5
      render_success
    else
      render_error("Upload Failed", note.errors.full_messages.first)
    end
  end

  def download
    note = Note.find(params[:id])
    if current_user.points > 0
      current_user.points -= 1
      render_success(data: { url: note.attachment_url })
    else
      render_error("Not Enough Points", "The user does not have enough points for this download")
    end
  end
end
