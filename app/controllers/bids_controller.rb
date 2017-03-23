class BidsController < ApplicationController
  def index
    @bids = Bid.all
    @item = Item.find_by(id:params[:item_id])
  end
  def new
    @bid = Bid.new
    @item = Item.find_by(id:params[:item_id])

  end

  def create

    item = Item.find_by_id(params[:item_id])
    @auction = item.auction_id
    @bid = item.bids.new(bid_params)
    @bid.auction_id = @auction
    @bid.user_id = current_user.id
    @bid.place_at = Time.now
    a = Auction.find_by(id:@auction)
    if @bid.place_at < a.donation_window_ends_at
      @bid.save
      flash[:succes] = "Succefull bid, we will inform at the end of the auction"
      redirect_to auction_items_path(@auction)
    else
      flash[:error] = "An error occured during the bidding, check that you didn't do the bidding after the window date" 
      redirect_to auction_items_path(@auction)
    end
  end

  private
  def bid_params
    params.require(:bid).permit(:amount_dollars)
  end
end
