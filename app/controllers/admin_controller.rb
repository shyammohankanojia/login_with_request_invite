class AdminController < ApplicationController
  def index
  redirect_to :controller =>'sessions',:action =>'new' 
  end

  def user_list
    @users = User.where(:active =>'false')
  end

  def active_user
#  render :text =>params[:selectuser].inspect;return
    if request.post?
       params[:selectuser].each do |userid,val|
        user = User.find(userid)
        user.update_attribute('active',true)
        UserMailer.activation(user).deliver 
      end
      flash[:notice]="User successfully Activated"
      redirect_to :action =>'user_list'
    end
  end

end
