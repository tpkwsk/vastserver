class CampaignsController < ApplicationController
  
  before_action :set_campaign, only: [:edit, :update, :destroy]
  
  def index
    unless params[:cuepoint_id]
      @campaigns = Campaign.all
    else
      @cuepoint = Cuepoint.find(params[:cuepoint_id])
      @campaigns = Campaign.current_available(@cuepoint)
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    end  
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      flash[:success] = "Create Campaign"
      redirect_to campaigns_url
    else
      flash.now[:danger] = "Invalid Values"
      render :new
    end
  end

  def edit
  end

  def update
    if @campaign.update(campaign_params)
      CampaignCuepoint.find_or_create_by(campaign_id: params[:id])
      flash[:success] = "Update Campaign"
      redirect_to campaigns_url
    else
      flash.now[:danger] = "Invalid Values"
      render :edit
    end
  end

  def destroy
    @campaign.destroy
    flash[:success] = 'Campaign is Deleted'
    redirect_to campaigns_url
  end
  
  private
  
  def set_campaign
     @campaign = Campaign.find(params[:id])
  end
  
  def campaign_params
    params.require(:campaign).permit(:name, :start_at, :end_at, :limit_start, :movie_url, cue_ids: [])
  end
  
  
  
end
