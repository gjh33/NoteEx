class Api::TeachingsController < ApiController
  def notes
    teaching = Teaching.find(params[:id])
    render_success(data: teaching.notes)
  end
end
