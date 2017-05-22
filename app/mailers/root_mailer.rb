class RootMailer < ApplicationMailer
	def welcome_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Приветсвуем в семье HM')
	end
	def cart_email(user , cart)
		@order = cart
		@user = user
	    mail(to: @user.email, subject: 'Мы приняли ваш заказ')	
	end
	def status_email(user)
		@user = user
	    mail(to: @user.email, subject: 'Статус вашего заказа обновлён')	
	end
end
