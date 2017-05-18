class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :have_user_or_admin , :get_categories ,:footer_sections_init
	def have_user_or_admin
		if user_signed_in?
			@user=current_user
		end
		if admin_signed_in?
			@admin=current_admin
		end
	end
	def get_categories
		@mainCat=Category.where(category_id:nil).order(:id)
	end
	def footer_sections_init
		if @user
			@footer_sections=FooterSection.where(visible: true)
		else
			@footer_sections=FooterSection.where(visible: true , see_all: true)
		end	
	end
	
end