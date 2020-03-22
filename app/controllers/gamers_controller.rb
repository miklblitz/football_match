class GamersController < ApplicationController
  before_action :set_gamer, only: [:show, :update, :destroy, :done_feature, :feature_for_last_five]

  # GET /gamers
  def index
    @gamers = Gamer.all

    render json: @gamers
  end
  
  def done_feature
    # проверка, что игрок выполнил такой-то показатель в матче
    has_feature =  @gamer.tags.where({match_id: params[:match_id], feature_id: params[:feature_id]})
    if has_feature.present?
      render json: has_feature
    else
      render json: '', status: :not_found
    end
  end
  
  def feature_for_last_five
    # проверка, что игрок выполнил такой-то показатель в последних 5 матчах
    match_ids = Match.order(created_at: :desc).limit(5).pluck(:id)

    has_feature =  @gamer.tags.where({match_id: match_ids})
    if has_feature.present?
      render json: has_feature
    else
      render json: '', status: :not_found
    end
  end

  # GET /gamers/1
  def show
    render json: @gamer
  end

  # POST /gamers
  def create
    @gamer = Gamer.new(gamer_params)

    if @gamer.save
      render json: @gamer, status: :created, location: @gamer
    else
      render json: @gamer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gamers/1
  def update
    if @gamer.update(gamer_params)
      render json: @gamer
    else
      render json: @gamer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gamers/1
  def destroy
    @gamer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamer
      @gamer = Gamer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gamer_params
      params.require(:gamer).permit(:name, :age)
    end
end
