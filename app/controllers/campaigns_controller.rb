class CampaignsController < ApplicationController
  
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
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      flash[:success] = "Update Campaign"
      redirect_to campaigns_url
    else
      flash.now[:danger] = "Invalid Values"
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:success] = 'Campaign is Deleted'
    redirect_to campaigns_url
  end
  
  #strong parameter
  def campaign_params
    params.require(:campaign).permit(:name, :start_at, :end_at, :limit_start, :movie_url)
  end
  
end
