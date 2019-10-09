class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  protect_from_forgery with: :null_session

  # before_action :authenticate_admin!

end
