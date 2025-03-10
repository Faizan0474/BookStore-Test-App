module Api
  class ItemsController < ApplicationController
    # GET /api/items
    def index
      items = Item.all
      render json: items
    end

    # GET /api/items/:id
    def show
      item = Item.find(params[:id])
      render json: item
    end
  end
end
