class CartController < ApplicationController
	def show
		@cart = logged_in? ? Cart.active.find(cookies.permanent[:log_cart]) : Cart.active.find(cookies.permanent[:stgr_cart])
		@goods = logged_in?  ? CartItem.where(cart_id: cookies.permanent[:log_cart]) : CartItem.where(cart_id: cookies.permanent[:stgr_cart])
		@count = {}
		@goods.each { |x| @count[x.item_id] = @count[x.item_id].nil? ? 1 : @count[x.item_id]+=1 }
		@goods = @goods.select(:item_id, :name, :price).distinct
	end

	def info
		@cart = logged_in? ? Cart.active.find(cookies.permanent[:log_cart]) : Cart.active.find(cookies.permanent[:stgr_cart])
		render 'info'
	end

	def submit
		p params
		if params[:defaults] == "1"
			@adr = current_user.address
			@num = current_user.number
		else
			@adr = get_address
			@num = params[:number]
		end
		@adr = "Самовывоз" if params[:self] == "1" 
		@cart = logged_in? ? Cart.active.find(cookies.permanent[:log_cart]) : Cart.active.find(cookies.permanent[:stgr_cart])
		puts @adr
		puts @num
		@id = logged_in? ? current_user.id : nil
		@cart.process(@id, @adr, @num)
		if logged_in? 
			cookies.permanent[:log_cart] = Cart.create(user_id: current_user.id).id 
		else
			cookies.permanent[:stgr_cart] = Cart.create.id
		end
		redirect_to "/"
	end

end
