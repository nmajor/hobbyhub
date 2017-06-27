class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_flavor_message
  before_action :set_button_text
  before_action :set_show_greeting

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

  def skip_pundit?
    devise_controller?
  end

  def set_show_greeting
    @show_greeting = session["greeted"] ? false : true
  end

  def set_flavor_message
    messages = [
      'Some of these hobbies involve going outside, so be careful.',
      'Get off your computer and do stuff... you know, after you are done here.',
      'Phones are not the only cure for boredom.',
    ];

    @flavor_message = messages.sample
  end

  def set_button_text
    texts = [
      'Hey Mikey, I think he likes it. Another?',
      'Next hobby!',
      'Another Hobby!',
      'That was delicious! I want another!',
    ];

    @button_text = texts.sample
  end
end
