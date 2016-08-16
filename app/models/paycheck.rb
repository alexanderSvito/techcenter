class Paycheck < ActiveRecord::Base
	belongs_to :user
	belongs_to :cart

	#validates :number, length: {is: 19}

	def print_all
		Paycheck.all.pluck(:user_id, :address, :total, :number) do |x|
			puts "The order for user with id #{x[0]} went to #{x[1]}"
			puts "#{x[2]} was taken from the card #{x[3]}"
			puts ""
			puts ""
		end
	end
end
