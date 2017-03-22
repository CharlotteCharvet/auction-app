class UsersController < ApplicationController

def index
  @user = User.all
end

def new
  @user = User.new
end

def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    redirect_to users_path
  else
    redirect_to '/signup'
  end
end



private
def user_params
  params.require(:user).permit(:name, :email_address, :password)
end


end
