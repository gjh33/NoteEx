class Api::CoursesController < ApiController
  def search
    courses = Course.search(params[:query])
    render_success(data: courses.as_json(include: :school))
  end

  def teachings
    course = Course.find(params[:id])
    render_success(data: course.teachings.as_json(include: [:teacher, :term]))
  end

  def show
    course = Course.find(params[:id])
    render_success(data: course.as_json(include: :school))
  end
end
