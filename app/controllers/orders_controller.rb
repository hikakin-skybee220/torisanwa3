class OrdersController < ApplicationController
  before_action :set_current_user

  def show
    @menu = Menu.find_by(id:params[:id])
  end

  def index
    @menus = Menu.all
    @orders=Order.where(seat_number:session[:user_id])
  end

  def create        
    @menu = Menu.find_by(id:params[:id])
    if @menu.item_id>3
      params[:size]="なし"
      @order = Order.new(seat_number:params[:seat_number],
                        name:@menu.name,
                        small_plate:params[:btn_small_plate],
                        size:params[:size],
                        etc:params[:etc],
                        quantity:1)   
    else
      @order = Order.new(seat_number:params[:seat_number],
                          name:@menu.name,
                          small_plate:params[:btn_small_plate],
                          size:params[:btn_size],
                          etc:params[:etc],
                          quantity:1)    
    end
    if @order.save
      session[:user_id] = @order.seat_number
      if params[:btn_cart]
        flash[:notice]="カートに追加しました"    
        redirect_to("/orders/index")
      else params[:btn_check]
        redirect_to("/orders/check/#{@order.seat_number}")
      end
    else 
      render("orders/show")
    end

  end

  def check
    @orders = Order.where(seat_number:session[:user_id])    
    @order = Order.find_by(seat_number:params[:id])
  end

  def edit
    @order = Order.find_by(id:params[:id])
    @menu = Menu.find_by(name:@order.name)
    
  end

  def update 
    @order = Order.find_by(id:params[:id])
    @order.seat_number=params[:seat_number]
    @order.small_plate = params[:btn_small_plate]
    @order.size = params[:btn_size]
    @order.etc = params[:etc]    

    if params[:btn_update]
      if @order.save
        session[:user_id] = @order.seat_number
        flash[:notice]="商品内容を変更しました"    
        redirect_to("/orders/check/#{@current_user.seat_number}")
      else
        render("/orders/edit")
      end
    else params[:btn_cancel]
      redirect_to("/orders/check/#{@current_user.seat_number}")
    end
  end

  def destroy
    @orders = Order.where(seat_number:params[:id])
    @orders.each do |order|
      order.destroy      
    end
    redirect_to("/orders/index")
    session[:user_id] = nil
  end

  def decision        
    @orders=Order.where(seat_number:session[:user_id])
    @orders.each do |order|
      @decision = Decision.new(seat_number:order.seat_number,
                          name:order.name,
                          small_plate:order.small_plate,
                          size:order.size,
                          etc:order.etc,
                          quantity:order.quantity)    
      if @decision.save
        order.destroy
      end
    end                        
    redirect_to("/orders/index")
    flash[:notice]="注文が完了しました"
    session[:user_id] = nil
  end
end
