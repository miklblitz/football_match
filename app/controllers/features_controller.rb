class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :update, :destroy, :top_btw_gamers, :top_btw_teams]

  # GET /features
  def index
    @features = Feature.all

    render json: @features
  end

  # Top-5 игроков по конкретному показателю в конкретной команде
  # GET /features/:id/top_btw_gamers/:team_id
  def top_btw_gamers
    gamers = Gamer.where({team_id: params[:team_id]}).pluck(:id)
    top_features = @feature.tags.includes(:gamer).group(["feature_id", "gamer_id"]).where({gamer_id: gamers}).order(count_id: :desc).limit(5)
    render json: top_features, status: :ok
  end

  # Top-5 игроков по конкретному показателю по всем командам в целом
  # GET /features/:id/top_btw_teams
  def top_btw_teams
    top_features = @feature.tags.includes(:gamer).group(["feature_id", "gamer_id"]).order(count_id: :desc).limit(5)
    render json: top_features, status: :ok
  end

  # GET /features/1
  def show
    render json: @feature
  end

  # POST /features
  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      render json: @feature, status: :created, location: @feature
    else
      render json: @feature.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /features/1
  def update
    if @feature.update(feature_params)
      render json: @feature
    else
      render json: @feature.errors, status: :unprocessable_entity
    end
  end

  # DELETE /features/1
  def destroy
    @feature.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feature_params
      params.require(:feature).permit(:name)
    end
end
