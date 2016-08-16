class UserController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]
	before_action :correct_user,   only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@data = @user.order_history
	end

	def new
		@user = User.new
		render 'new'
	end

	def edit
    	@user = User.find(params[:id])
  	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	      @user.send_activation_email
	      log_in @user
	      cookies.permanent[:log_cart] = Cart.create!(user_id: @user.id).id
	      redirect_to @user
	    else
	      render 'new'
	    end
  	end

	def update
	    @user = User.find(params[:id])
	    if @user.authenticate(params[:user][:password_old])
	    	p params
	    	@user.avatar = params[:avatar] if !params[:avatar].nil?
		    @user.name = params[:name] if !params[:name].empty?
			@user.email = params[:email] if !params[:email].empty?
			@user.number = params[:number] if !params[:number].empty?
			@user.update_attributes(user_params) if !params[:user][:password].empty? && params[:user][:password] == params[:user][:password_confirmation]
			@user.address = get_address if !params[:city].empty?  
			@user.save!
			@data = @user.order_history
			render 'show'
		else
			@error = "Неверный пароль"
			render 'edit'
		end
	end

	private

	#making hash acceptable
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

	# Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


end
