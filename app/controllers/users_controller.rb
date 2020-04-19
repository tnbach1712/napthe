class UsersController < ApplicationController
  def history
    @history_orders = current_user.orders
  end
end
