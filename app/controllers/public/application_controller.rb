class Public::ApplicationController < ApplicationController
  before_action :authenticate_customer!
end