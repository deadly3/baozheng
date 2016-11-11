class Admin::UsersController < ApplicationController
  before_filter :require_is_admin
  
end
