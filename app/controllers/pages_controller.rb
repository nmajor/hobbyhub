class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized, only: [:home]

  def home
    redirect_to random_hobbies_path
  end
end
