class Item < ActiveRecord::Base
	belongs_to :cart_item
	has_attached_file :avatar, :default_url => "/system/items/missing.png"

	validates :group, inclusion: { in: %w(printer mfu scanner paper cartridge shredder laminator bookbinder other)}
	validates :name, :price, presence: true
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


	def calculate_rate
		Feedback.where(item_id: self.id).average("rate") || 5.0
	end

	def add_to_cart(uid)
		if Cart.where("status = true AND user_id = ?", uid).any?
			CartItem.create(cart_id: Cart.where("status = true AND user_id = ?", uid).first.cart_id, item_id: self.item_id, name: self.name, price: self.price)
		else
			puts "There are no active Cart. Please, select or create one"
		end
	end

end
