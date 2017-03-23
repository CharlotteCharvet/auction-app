class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end
  
  def new
    @auction = Auction.new
  end

  def show
    @auction = Auction.find_by(params[:auction_id])
  end

  def create
    @auction = Auction.new(auction_params)
    if @auction.save
      redirect_to auction_path(params[:auction_id])
    else
      redirect_to users_path
    end
  end

  private
  def auction_params
    params.require(:auction).permit(:name, :starts_at, :ends_at, :time_zone_id, :physical_address,:donation_window_ends_at)
  end


end
