class CartsController < ApplicationController
	before_action :authenticate_user! , :only => [:create_order, :diver , :order ]
	def order_create
		puts params
		@order=Order.new(order_params)
		@order.user=current_user
		data = JSON.parse order_params[:json]
	    
		@order.status = 'Ожидает платежа'
	    
	      	@address = Address.where(user: current_user)[0]||Address.new
	      	
	      	@address.city=order_address_params["city"]
	      	@address.post_index=order_address_params["post_index"]
	      	@address.user=@order.user
	      	@address.save
	      	@order.address_ref = @address
	      	
	      	@order.address=@address.city+" "+@address.post_index

	    respond_to do |format|
	      if @order.save
	      	@order.sum=0
	      	if data && data!=[]
		      	data.each { |d|
		      		a=OrdersProductDatum.new
		      		a.order_id=@order.id
		      		a.count=d['count']
		      		a.product_datum_id=d['id']
		      		a.product_size=ProductSize.find_by(size: d['size'])
		      		pd = ProductDatum.find(d['id'])
		      		@order.sum += (pd.promotional_price||pd.price)*a.count
		      		a.save
		      	}
	      	end
	      	@order.save        

	      	RootMailer.cart_email(@user , @order).deliver_now
	      	if params[:money][:money]=="liqpay"
		        format.html {redirect_to controller:"carts", action:"liqpay_request", id:  @order.id , notice: 'Color was successfully created.' }
		        format.json { render :show, status: :created, location: @order }
	      	else
		        format.html {redirect_to controller:"carts", action:"order", id:  @order.id , notice: 'Color was successfully created.' }
		        format.json { render :show, status: :created, location: @order }
	      	end
	      else
	        format.html { render :new }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def liqpay_request
		@order=Order.find(params[:id])
		@liqpay_request = Liqpay::Request.new(	:amount => @order.sum,
												:currency => 'UAH',
												:order_id => @order.id,
												:description => 'Ваш заказ',
												server_url: liqpay_payment_url
												)
		#:server_url => liqpay_payment 
	end

	def liqpay_payment 
		@liqpay_response = Liqpay::Response.new(params) 
		@order=Order.find(@liqpay_response.order_id)
		if @liqpay_response.success? && @order && @order.sum==@liqpay_reponse.amount 
			# обработать платеж 
			@order.status="Принят"
		else 
			@order.status="Ошибка"
		end 
		@order.save
		format.html {redirect_to controller:"carts", action:"order", id:  @order.id , notice: 'Color was successfully created.' }
        format.json { render :show, status: :created, location: @order }
	end
	def diver
		@payment=payment_method
		@order=Order.new()

		@addresses=Address.where(user: @user)
		unless  @addresses[0]
			@address=Address.new(user: @user)
			@address.save
		else
			@address=@addresses[0]
		end
		@order.address_ref=@address
	end
	def order_activate
		@order=Order.find(params[:id])
		@order.bool_factor=true
		@order.save
		 msg = { 
	    	:status => "ok",
	    	:message => "Success!"
	    }
	    format.json  { render :json => msg }
	end
	def order_params
   		params.require(:order).permit(:json)
   	end
   	def order_address_params
   		params.require(:order).require(:address_ref_attributes)
    end
    def payment_method
    	[ [ "Оплата через liqpay", "liqpay" ] ,
    	  [ "Оплата через терминал ПриватБанка или Приват24" , "privat24"] ]
    end
end
