class UsersController < ApplicationController

def index
  @user = User.all
  @bids= Bid.all
  @auction = Auction.all
  @items = Item.all
  @finalist = []
  @arra = [9,8,7]

  @arra.each do |item| 
    @selec_bid = @bids.where(item_id:item)

    @result = @selec_bid.sort_by do |r|
       r.amount_dollars
    end
   
    biggest_amount = @result.last.amount_dollars
    @check = @selec_bid.where(amount_dollars:biggest_amount)

    @final = @check.sort_by do |f|
       f.place_at
    end
   @finalist << @final.first 
  end   
   

end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  respond_to do |format|
      if @user.save

        format.html { redirect_to '/login', notice: "User was successfully created." }
        # format.js {}
        format.json { render json: @user, status: :created }
      else
        format.html {render action:'new'}
        format.js {}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end
  # if user.save
  #   session[:user_id] = user.id
  #   redirect_to users_path
  # else
  #   redirect_to '/signup'
  # end
end



private
def user_params
  params.require(:user).permit(:name, :email_address, :password)
end


end
