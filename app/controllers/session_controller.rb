class SessionController < ApplicationController
	
	def new
		render 'new'
	end

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to user
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

	def destroy
		log_out
		redirect_to root_url
	end

end
