class AdminController < ApplicationController
	before_action :admin_user, only: [:index, :feededit, :feedupdate, :feeddestroy]

	def index
		@orders = {}.tap do |x|
			Cart.where(status: false).each do |t|
				x[t.id] = {}.tap do |r|
					CartItem.where(cart_id: t.id).each do |y|
						r[y.item_id] ||= {}
						r[y.item_id][:count] ||= 0
						r[y.item_id][:count] += 1
						r[y.item_id][:name] = y.name
						r[y.item_id][:updated_at] = y.updated_at
						r[y.item_id][:price] = y.price
						r[y.item_id][:total] ||= t.estimate
						r[y.item_id][:address] ||= Paycheck.find_by(cart_id: t.id).address
						r[y.item_id][:number] ||= Paycheck.find_by(cart_id: t.id).number
					end
				end
			end
		end
	end

	def feededit
		@feed = Feedback.find(params[:id])
	end

	def feedupdate
		Feedback.find(params[:id]).update(feed_params)
		redirect_to "/"
	end

	def feeddestroy
		Feedback.find(params[:id]).delete
		redirect_to "/"
	end

	def feed_params
		params.permit(:review)
	end

	def admin_user
		if current_user == nil
			redirect_to "/"
		else
			redirect_to "/" unless current_user.id == 1
		end
	end

end
