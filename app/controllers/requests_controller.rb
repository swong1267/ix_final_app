class RequestsController < ApplicationController
  def index
    @erequests = Request.all
  end
end