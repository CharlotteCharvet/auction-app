class BraintreeController < ApplicationController
  
  def new
    
    @client_token = Braintree::ClientToken.generate
    @bid = Bid.find_by(id: params[:bid_id].to_i)
    
  end

  def checkout

    @bid = Bid.find_by(id: params[:checkout_form][:bid_id].to_i)
    price = @bid.amount_dollars
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => price, #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      
      
      redirect_to users_path, :flash => { :success => "Transaction successful!" }
    else
      redirect_to users_path, :flash => { :error => "Transaction failed. Please try again." }
    end 
  end



end
