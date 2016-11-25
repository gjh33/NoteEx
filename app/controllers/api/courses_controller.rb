class Api::CoursesController < ApiController
  def search
    courses = Course.search(params[:query])
    render_success(data: courses)
  end
end
