class CampaignsController < ApplicationController
  
  before_action :set_campaign, only: [:edit, :update, :destroy]
  
  def index
    @campaigns = Campaign.all
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
