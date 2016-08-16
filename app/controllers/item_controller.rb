class ItemController < ApplicationController

	def show
		@item = Item.find(params[:id])
		@avatar = @item.avatar.url
		@feed = Feedback.where(item_id: params[:id]).map { |e| {:id => e.id,:avatar => User.find(e.user_id).avatar.url, :rate => e.rate, :review => e.review, :name =>  User.find(e.user_id).name} }
	end

	def create 
		params[:details] = storeable params[:details]
		@item = Item.create(item_params)
		redirect_to "/item/#{@item.id}"
	end

	def add
		@item = Item.find(params[:id])
		params[:product][:quantity].to_i.times do
			if logged_in?
				CartItem.create(cart_id: cookies.permanent[:log_cart], item_id: @item.id, name: @item.name, price: @item.price, group: @item.group)
			else
				CartItem.create(cart_id: cookies.permanent[:stgr_cart], item_id: @item.id, name: @item.name, price: @item.price, group: @item.group)
			end
		end
		redirect_to item_url(@item.id)
	end

	def rate
		Feedback.create(item_id: params[:id], user_id: current_user.id, review: params[:review], rate: params[:rating])
		redirect_to "/item/#{params[:id]}"
	end

	def edit
		params[:details] = storeable params[:details]
		@item = Item.find(params[:id]).update(item_params)
		redirect_to "/item/#{params[:id]}"
	end

	def destroy
		Item.find(params[:id]).delete
		redirect_to "/"
	end

	def item_params
		params.permit(:avatar, :name, :description, :details, :price, :group)
	end
end
