class CartItem < ActiveRecord::Base
	belongs_to :cart
	has_one :item
	
	scope :items, -> (id) {where(cart_id: id)}

end
