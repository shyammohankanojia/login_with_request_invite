class AdminController < ApplicationController
  def index
  redirect_to :controller =>'sessions',:action =>'new' 
  end

  def user_list
    @users = Request.where(:status =>false)
  end

  def active_user
#  render :text =>params[:selectuser].inspect;return
    if request.post?
       params[:selectuser].each do |userid,val|
        user = Request.find(userid)
        user.update_attribute('status',1)
        UserMailer.approve_notification(user).deliver 
      end
      flash[:notice]="User successfully Activated"
      redirect_to :action =>'user_list'
    end
  end

end
