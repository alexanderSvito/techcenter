class CreditCard < ActiveRecord::Base
	belongs_to :user

	validates :number, length: {is: 19}

	scope :number, -> (num) {where(number: num)}
	scope :of_user, -> (uid) {where(user_id: uid)}

	def transit(sum)
		self.balance+=sum
		self.save!
	end

	def is_enough?(sum)
		self.balance-sum>=0
	end
	
	def activate
		CreditCard.where("user_id = ? AND status = ?",self.user_id, true).first.update(status: false) if CreditCard.all.where("user_id = ? AND status = ?",self.user_id, true).any?
		self.update(status: true)
	end
end
