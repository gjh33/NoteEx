class Api::UsersController < ApiController
  def show
    user = User.find(params[:id])
    render_success(data: user.as_json(except: [:encrypted_password]))
  end
end
