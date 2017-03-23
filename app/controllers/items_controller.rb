class ItemsController < ApplicationController

  def index
    @items = Item.where(auction_id:params[:auction_id])
    @auction = Auction.find(params[:auction_id])
    @items = @items.similar_to(params[:query]) if params[:query].present?
    @bids = Bid.all
    

    if params[:last_id]
      @items_display = @items.where('id < ?', params[:last_id]).limit(5)
    else
      @items_display = @items.limit(5)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end


  def new
    @item = Item.new
  end


  def create
    auction = Auction.find(params[:auction_id])
    @item = auction.items.new(item_params)
    if @item.save

      @items = Item.all
      redirect_to auction_items_path(params[:auction_id])
    else
      render 'new'
    end
  end

  def update
    
    if @item.update(item_params)
      flash[:success] = "successfuly updated the item"
      redirect_to auction_path(params[:auction_id])
    else
      flash[:danger] = "Error updating item"
      redirect_to users_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :estimation, photos:[])
  end

end
