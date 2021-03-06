class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?
  before_action :set_style, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def set_style
    @style = "background-image: url('#{view_context.image_path('back1.jpg')}'); background-size: cover; height:100vh" if request['controller'] == 'devise/sessions' && request['action'] == 'new'
    @style = "background-image: url('#{view_context.image_path('back2.jpg')}'); background-size: cover; height:100vh" if request['controller'] == 'devise/passwords' && request['action'] == 'new'
    @style = "background-image: url('#{view_context.image_path('back3.jpg')}'); background-size: cover; height:100vh" if request['controller'] == 'devise/registrations' && request['action'] == 'new'
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

def configure_permitted_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :is_athlete])

  # devise_parameter_sanitizer.permit(:account_update, keys: [:address, :is_athlete])
end

end
