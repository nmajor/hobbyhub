class HobbiesController < ApplicationController
  before_action :set_hobby, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :random]
  skip_after_action :verify_authorized, only: [:random]

  def index
    @hobbies = policy_scope(Hobby)
  end

  def show
    @hobby = Hobby.find_by_slug(params[:slug])
    authorize @hobby
    if !@hobby
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def new
    @hobby = Hobby.new
    authorize @hobby
  end

  def edit
  end

  def create
    @hobby = Hobby.new(hobby_params)
    authorize @hobby

    if @hobby.save
      redirect_to edit_hobby_path(@hobby), notice: 'Hobby was successfully created.'
    else
      render :new
    end
  end

  def update
    # byebug
    # hobby_params[:tags] = hobby_params[:tags].reject{|t| return t.blank? }

    if @hobby.update(hobby_params)
      redirect_to edit_hobby_path(@hobby), notice: 'Hobby was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hobby.destroy
    redirect_to hobbies_url, notice: 'Hobby was successfully destroyed.'
  end

  def random
    offset = rand(Hobby.count)
    @hobby = Hobby.where(public: true).offset(offset).first
    redirect_to hobby_slug_path(slug: @hobby.slug)
  end

  private
    def set_hobby
      @hobby = Hobby.find(params[:id])
      authorize @hobby
    end

    def hobby_params
      params.require(:hobby).permit(:name, :desc, :public, :difficulty, :starting_cost, :repeat_cost, resources_attributes: [:id, :ref, :desc, :position, :_destroy], affiliate_links_attributes: [:id, :ref, :desc, :position, :_destroy], visuals_attributes: [:id, :ref, :desc, :position, :_destroy], tag_list: [])
    end
end
