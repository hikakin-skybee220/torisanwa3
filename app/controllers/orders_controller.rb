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

    @order = Order.new(
      seat_number: params[:seat_number],
      name: @menu.name,
      small_plate: params[:btn_small_plate],
      size: params[:btn_size],
      etc: params[:etc],
      shichimi: params[:btn_shichimi],
      yuzu_pepper: params[:btn_yuzu_pepper],
      lemon: params[:btn_lemon],
      quantity:params[:quantity],
      price: params[:price]
      )  


    if params[:btn_check]

      if @order.save
        session[:user_id] = @order.seat_number
        redirect_to("/orders/#{@order.seat_number}/check")
      else
        redirect_to("/orders/#{@menu.id}")
      end

    else params[:btn_cart]
      
      if @order.save
        session[:user_id] = @order.seat_number
        flash[:notice]="カートに追加しました"    
        redirect_to("/orders/index")
      else
        redirect_to("/orders/#{@menu.id}")
      end
      
    end

  end

  def check
    @orders = Order.where(seat_number:params[:id])    
    @order = Order.find_by(seat_number:params[:id])
    @su = @orders.sum(:price)

  end

  def edit
    @order = Order.find_by(id:params[:id])
    @menu = Menu.find_by(name:@order.name)
    
  end

  def update 
    @order = Order.find_by(id: params[:id])
    @order.seat_number=params[:seat_number]
    @order.small_plate = params[:btn_small_plate]
    @order.size = params[:btn_size]
    @order.etc = params[:etc]   
    @order.shichimi = params[:btn_shichimi]
    @order.yuzu_pepper = params[:btn_yuzu_pepper]
    @order.lemon = params[:btn_lemon]
    @order.quantity = params[:quantity]
    @order.price = params[:price]

    if params[:btn_update]
      if @order.save
        session[:user_id] = @order.seat_number
        redirect_to("/orders/#{@order.seat_number}/check")
        flash[:notice]="商品内容を変更しました"    
      else
        redirect_to("/orders/#{@order.id}/edit")
      end      
    else params[:btn_cancel]
      redirect_to("/orders/#{@current_user.seat_number}/check")
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
      @decision = Decision.new(
        seat_number:order.seat_number,
        name:order.name,
        small_plate:order.small_plate,
        size:order.size,
        etc:order.etc,
        quantity:order.quantity,
        option: "#{order.shichimi}  #{order.yuzu_pepper}  #{order.lemon}"        
        )    
      if @decision.save
        order.destroy
      end
    end                        
    redirect_to("/orders/index")
    flash[:notice]="注文が完了しました"
    session[:user_id] = nil
  end
end
