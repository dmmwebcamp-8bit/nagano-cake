class Public::ApplicationController < ApplicationController
  before_action :authenticate_customer!
end

class Public::ItemsController < Public::ApplicationController
  skip_before_action :authenticate_customer!
end

class Public::HomesController < Public::ApplicationController
  skip_before_action :authenticate_customer!
end