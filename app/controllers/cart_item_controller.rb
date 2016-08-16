class CartItemController < ApplicationController
	
	def destroy
		if logged_in? 
			CartItem.where(cart_id: cookies.permanent[:log_cart], item_id: params[:id]).take.destroy
			redirect_to "/cart/#{cookies.permanent[:log_cart]}"
		else
			CartItem.where(cart_id: cookies.permanent[:stgr_cart], item_id: params[:id]).take.destroy
			redirect_to "/cart/#{cookies.permanent[:stgr_cart]}"
		end
	end

	def remove
		if logged_in? 
			CartItem.where(cart_id: cookies.permanent[:log_cart], item_id: params[:id]).destroy_all
			redirect_to "/cart/#{cookies.permanent[:log_cart]}"
		else
			CartItem.where(cart_id: cookies.permanent[:stgr_cart], item_id: params[:id]).destroy_all
			redirect_to "/cart/#{cookies.permanent[:stgr_cart]}"
		end
	end

	def add
		if logged_in? 
			tmp = CartItem.where(cart_id: cookies.permanent[:log_cart], item_id: params[:id]).take.dup.save!
			redirect_to "/cart/#{cookies.permanent[:log_cart]}"
		else
			tmp = CartItem.where(cart_id: cookies.permanent[:stgr_cart], item_id: params[:id]).take.dup.save!
			redirect_to "/cart/#{cookies.permanent[:stgr_cart]}"
		end
	end	
end
