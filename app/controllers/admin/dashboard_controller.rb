class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: env["USERNAME"], password: env["PASSWORD"]

  def show
  end
end
