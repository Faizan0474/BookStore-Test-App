module Api
  class NotificationsController < ApplicationController
    # GET /api/notifications?customer_id=1
    def index
      notifications = Notification.where(customer_id: params[:customer_id])
      render json: notifications
    end
  end
end
