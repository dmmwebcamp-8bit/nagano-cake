class ApplicationController < ActionController::Base
end

# class Public::ApplicationController < ApplicationController
#   before_action :authenticate_customer!, except: [:top,:about]
# end

# class Admin::ApplicationController < ApplicationController
#   before_action :authenticate_admin!
# end