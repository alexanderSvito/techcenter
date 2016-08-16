class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :cart_items
	has_many :items, :through => :cart_items
	has_one :paycheck
 
	scope :user, -> (uid) {find_by_sql("SELECT * FROM carts c JOIN users u ON c.user_id=u.user_id WHERE c.user_id=#{uid}")}
	scope :active, -> {where(status: true)}

	def estimate
		CartItem.where(cart_id: self.id).pluck(:price).reduce(:+)
	end

	def process user, adr, num
		Paycheck.create(user_id: user, cart_id: self.id, address: adr, number: num, total: self.estimate)		
		self.update(status: false)
	end

end
