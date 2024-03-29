class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  # render new.rhtml
  def signup_request
    logout_keeping_session!
    if request.post?
      @user = Request.new(params[:user])
      @user.status = 0
      success = @user && @user.save
      if success && @user.errors.empty?
        UserMailer.request_notification(@user).deliver 
        redirect_back_or_default('/', :notice => "Thanks for signing up request!  We're sending you an email link for registration.")
      else
        flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (admin@example.com)."
        render :action => 'signup_request'
      end
    end
  end

  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    request_email =Request.find_by_email(@user.email)
    if request_email
        success = @user && @user.save
        if success && @user.errors.empty?
          redirect_back_or_default('/', :notice => "Thanks for signing up!  We're sending you an email with your activation code.")
        else
          flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
          render :action => 'new'
        end
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.Email do'nt matched."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?)
      user.activate!
      redirect_to '/login', :notice => "Signup complete! Please sign in to continue."
    when params[:activation_code].blank?
      redirect_back_or_default('/', :flash => { :error => "The activation code was missing.  Please follow the URL from your email." })
    else 
      redirect_back_or_default('/', :flash => { :error  => "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in." })
    end
  end

end
