class GreetingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:dismiss]
  skip_after_action :verify_authorized, only: [:dismiss]

  def dismiss
    session[:greeted] = true
  end
end
