class OrdersController < ApplicationController



 # GET /products/new


def index
  #@article = Article.find(params[:article_id])
  #@order=@article.orders
  @order=Order.all
  end




  def new
  	#@article= Article.find(params[:article_id])
    #@order = @article.orders.build
    @order=Order.new
  end


  def create
    #render :text => params[:article].to_yaml and return
    @order = Order.new(order_params)
 
      if @order.save
        redirect_to action: :index
      else
       render 'new'
    end
end
   def destroy
      @order = Order.find(params[:id])
    @order.delete
    redirect_to action: :index
   end



private

 def order_params

      params.require(:order).permit(:name, :desc,:article_id)
    end
end
