class Admin::BaseController < ApplicationController
  before_action :authorize

  layout 'admin'
end
