class Campaign < ApplicationRecord

	def actual?
		(number>0||inf_number)&&(period>Time.now||inf_period)
	end

	def get_one
		if (!inf_number || number>0)
			self.number-=1
			self.save
		end
	end
end