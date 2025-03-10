module Api
  class OrdersController < ApplicationController
    # GET /api/orders
    def index
      orders = Order.all
      render json: orders, include: :order_items
    end

    # POST /api/orders
    def create
      order = Order.new(order_params)
      if order.save
        render json: { message: "Order placed successfully!", order: order }, status: :created
      else
        render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # GET /api/orders/:id
    def show
      order = Order.find(params[:id])
      render json: order, include: :order_items
    end

    private

    def order_params
      params.require(:order).permit(:customer_id, order_items_attributes: [:item_id, :quantity])
    end
  end
end
